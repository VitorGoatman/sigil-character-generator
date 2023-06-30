include karax / prelude
import sugar, dom, math
import chargen

proc download(filename, textInput: string) =
  var element = document.createElement("a");
  element.setAttribute("href",
  "data:text/plain;charset=utf-8, " & encodeURIComponent(textInput))
  element.setAttribute("download", filename);
  document.body.appendChild(element);
  element.click();
  document.body.removeChild(element);

var specialties: seq[tuple[name: string, num: int]]
for i in 0..9:
  let (sk1, sk2) = (player.physSk[i], player.mindSk[i])
  for s in [sk1, sk2]:
    if s.value >= 50:
      let spc = floorDiv(s.value - 40, 10)
      specialties.add (name: s.name, num: spc)

proc skillTable(): VNode =
  result = buildHtml(tdiv):
    table:
      tr: th(class = "w3-theme-l1", colspan = "8"): text "Skills"
      tr:
        th(colspan = "2"): text "Combat"
        th(colspan = "2"): text "Exploration"
        th(colspan = "2"): text "Social"
        th(colspan = "2"): text "Mental"

      let
        combat =
          [player.physSk[4], player.physSk[7], player.physSk[9],
          player.physSk[2], player.physSk[6]]
        explo =
          [player.physSk[5], player.physSk[0], player.physSk[8],
          player.physSk[3], player.physSk[1]]
        social =
          [player.mindSk[1], player.mindSk[2], player.mindSk[4],
          player.mindSk[5], player.mindSk[8]]
        mental =
          [player.mindSk[7], player.mindSk[9], player.mindSk[6],
          player.mindSk[3], player.mindSk[0]]

      for i in 0..4:
        tr:
          td: text combat[i].name
          td: text $combat[i].value
          td(class = "w3-border-left"): text explo[i].name
          td: text $explo[i].value
          td(class = "w3-border-left"): text social[i].name
          td: text $social[i].value
          td(class = "w3-border-left"): text mental[i].name
          td: text $mental[i].value

      if specialties != @[]:
        tr: th(class = "w3-theme-l1", colspan = "8"): text "Specialties"
        for i in 0..9:
          let (sk1, sk2) = (player.physSk[i], player.mindSk[i])
          for s in [sk1, sk2]:
            if s.value >= 50:
              let spc = floorDiv(s.value - 40, 10)
              if spc > 1:
                tr: td(colspan = "8"): text $spc & " " & s.name & " Specialties available."
              else:
                tr: td(colspan = "8"): text $spc & " " & s.name & " Specialty available."

proc woundTable(): VNode =
  result = buildHtml(table(VStyle = "width:500px;", class = "w3-section")):
    tr: th(class = "w3-theme-l1", colspan = "4"): text "Wounds"
    let
      hitlocals = ["Head", "Torso", "L. Arm", "R. Arm", "L. Leg", "R. Leg"]
      wounds = ["Minor", "Severe", "Grievous"]
    tr:
      th()
      for w in wounds: th(class = "w3-border-theme w3-leftbar"): text w
    for ht in hitlocals:
      tr:
        td(id = "lbl", class = " w3-right-align"): text ht
        for w in wounds:
          td(class = "w3-center"):
            input(type = "checkbox", class = "w3-check", disabled = true)
            if bonusMeatWound > 0:
              for i in 1..bonusMeatWound: input(type = "checkbox",
                  class = "w3-check", disabled = true)

proc contacts(): VNode =
  result = buildHtml(table(class = "w3-section")):
    tr: th(colspan = "4", class = "w3-theme-l1"): text "Contacts"
    tr:
      th: text "Name"
      th(class = "w3-leftbar w3-border-theme"): text "Usefulness"
      th(class = "w3-leftbar w3-border-theme"): text "Aptitude"
      th(class = "w3-leftbar w3-border-theme"): text "Influence"
    for c in player.contacts:
      tr:
        td(class = "w3-right-align", id = "lbl"): text c.name
        td: text c.usefulness
        td(class = "w3-center"): text $c.aptitude.value
        td(class = "w3-center"): text $c.influence.value

proc backstory(): VNode =
  result = buildHtml(tdiv):
    table(class = "w3-section"):
      tr: th(colspan = "2", class = "w3-theme-l1"): text "Backstory"
      for q in qna:

        tr: th(colspan = "2"): text q.question
        tr: td(colspan = "2", class = "w3-center w3-border-theme"):
          text q.answer.txt
        if q.answer.sn1 != "":
          tr:
            td(class = "w3-small w3-border-theme w3-topbar w3-rightbar w3-center"):
              text q.answer.sn1 & " + " & $q.answer.sk1
            td(class = "w3-small w3-border-theme w3-topbar w3-center"):
              text q.answer.sn2 & " + " & $q.answer.sk2

proc makePage(): VNode =
  result = buildHtml(main(class = "w3-container")):
    tdiv(class = "w3-padding-16 w3-border-bottom w3-border-theme w3-center"):
      img(width = "450px", src = "Sigil Atelier Full Logo - Black.png")
      h1: text "CHARACTER GENERATOR"
      button(class = "w3-button w3-theme-action", onclick = () =>
             download(player.name & " - Sigil 1.7 Sheet.txt", getMd())):
        text "Download this character!"

    tdiv(class = "w3-row"):
      tdiv(class = "w3-half"):
        tdiv(class = "w3-section"):
          tdiv:
            span(id = "lbl"): text "Character Name: "
            text player.name
            span(id = "lbl", class = "w3-margin-left"): text "Age: "
            text $player.age
          tdiv():
            span(id = "lbl"): text "Wealth: "
            text $player.wealth
            span(id = "lbl", class = "w3-margin-left"): text "Sex: "
            text player.sex
            span(id = "lbl", class = "w3-margin-left"): text "Handedness: "
            text player.handedness

        skillTable()
        contacts()
        woundTable()

      tdiv(class = "w3-half"):
        backstory()

setRenderer makePage
