import random
import macros

type
  Skill* = tuple
    name: string
    value: int
  SkRes* = tuple
    txt:string
    sn1,sn2: string
    sk1,sk2: int

proc skillInc*(sk:var Skill):int =
  result = rand 1..5
  sk.value += result

proc skName*(sk: Skill):string =
  return sk.name

proc roll*(n,d:int,m = 0):int =
  for nd in 1..n:
    result += (rand 1..d)+m

# dumpAstGen:
#   proc myLookup*(n,d:int,m = 0):SkRes =
#     let r = roll(n,d)
#     return case r:
#       of 1:
#         ("foo",
#         athletics.name,
#         drive.name,
#         skillInc athletics,
#         skillInc drive)
#       of 2..3: "bar"
#       of 3..5: "baz"
#       else: "?"

proc genCase(ranges: seq[tuple[range: HSlice[int,int], value: string]]): NimNode =
  result = nnkCaseStmt.newTree(
    newIdentNode("r")
  )
  for r in ranges:
    result.add nnkOfBranch.newTree(
      nnkInfix.newTree(
        newIdentNode(".."),
        newLit(r.range.a),
        newLit(r.range.b)
      ),
      nnkStmtList.newTree(
        newLit(r.value)
      )
    )
  result.add nnkElse.newTree(
    nnkStmtList.newTree(
      newLit("?")
    )
  )
  
macro oracleTable*(name: untyped, body: untyped): untyped =
  # echo body.treeRepr
  # determine min and max
  var min = 999
  var max = -999
  var ranges = newSeq[tuple[range: HSlice[int,int], value: string]]()
  for n in body:
    if n.len == 2:
      let v = n[0].intVal.int
      if v < min:
        min = v
      if v > max:
        max = v
      ranges.add((v..v, n[1][0].strVal))
    elif n.len == 4:
      let v0 = n[1].intVal.int
      let v1 = n[2].intVal.int
      if v0 < min:
        min = v0
      if v1 < min:
        min = v1
      if v0 > max:
        max = v0
      if v1 > max:
        max = v1
      ranges.add((v0..v1, n[3][0].strVal))
    
  result = nnkStmtList.newTree(
    nnkProcDef.newTree(
      nnkPostfix.newTree(
        newIdentNode("*"),
        name
      ),
      newEmptyNode(),
      newEmptyNode(),
      nnkFormalParams.newTree(
        newIdentNode("string"),
      ),
      newEmptyNode(),
      newEmptyNode(),
      nnkStmtList.newTree(
        nnkLetSection.newTree(
          nnkIdentDefs.newTree(
            newIdentNode("r"),
            newEmptyNode(),
            nnkCall.newTree(
              newIdentNode("roll"),
              newLit 1,
              newLit 100,
            )
          )
        ),
        nnkReturnStmt.newTree(
          genCase(ranges)
        )
      )
    )
  )
  
proc genSkCase(ranges: seq[tuple[range: HSlice[int,int], value,sk1,sk2: string]]): NimNode =
  result = nnkCaseStmt.newTree(
    newIdentNode("r")
  )
  for r in ranges:
    result.add nnkOfBranch.newTree(
      nnkInfix.newTree(
        newIdentNode(".."),
        newLit(r.range.a),
        newLit(r.range.b)
      ),
      nnkStmtList.newTree(
        nnkTupleConstr.newTree(
          newLit(r.value),
          nnkCommand.newTree(
            newIdentNode("skName"),
            newIdentNode(r.sk1)
          ),
          nnkCommand.newTree(
            newIdentNode("skName"),
            newIdentNode(r.sk2)
          ),
          nnkCommand.newTree(
            newIdentNode("skillInc"),
            newIdentNode(r.sk1)
          ),
          nnkCommand.newTree(
            newIdentNode("skillInc"),
            newIdentNode(r.sk2)
          )
        )
      )
    )

  result.add nnkElse.newTree(
    nnkStmtList.newTree(
      nnkTupleConstr.newTree(
        newLit("?"),
        newLit("?"),
        newLit("?"),
        newLit(0),
        newLit(0)
      )
    )
  )

macro skillTable*(name: untyped, body: untyped): untyped =
  # echo body.treeRepr
  # determine min and max
  var min = 999
  var max = -999
  var ranges = newSeq[tuple[range: HSlice[int,int], value,sk1,sk2: string]]()
  for n in body:
    if n.len == 2:
      let v = n[0].intVal.int
      if v < min:
        min = v
      if v > max:
        max = v
      ranges.add((v..v, n[1][0].strVal,n[1][1].strVal,n[1][2].strVal))
    elif n.len == 4:
      let v0 = n[1].intVal.int
      let v1 = n[2].intVal.int
      if v0 < min:
        min = v0
      if v1 < min:
        min = v1
      if v0 > max:
        max = v0
      if v1 > max:
        max = v1
      ranges.add((v0..v1, n[3][0].strVal,n[3][1].strVal,n[3][2].strVal))
    
  result = nnkStmtList.newTree(
    nnkProcDef.newTree(
      nnkPostfix.newTree(
        newIdentNode("*"),
        name
      ),
      newEmptyNode(),
      newEmptyNode(),
      nnkFormalParams.newTree(
        newIdentNode("SkRes")
      ),
      newEmptyNode(),
      newEmptyNode(),
      nnkStmtList.newTree(
        nnkLetSection.newTree(
          nnkIdentDefs.newTree(
            newIdentNode("r"),
            newEmptyNode(),
            nnkCommand.newTree(
              newIdentNode("rand"),
              nnkInfix.newTree(
                newIdentNode(".."),
                newLit(1),
                newLit(100)
              )
            )
          )
        ),
        nnkReturnStmt.newTree(
          genSkCase(ranges)
        )
      )
    )
  )
