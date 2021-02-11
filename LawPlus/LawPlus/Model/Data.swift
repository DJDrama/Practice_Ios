//
//  Data.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import Foundation

let CI = "민법"
let CR = "형법"

let lawData = [
    LawItem(lawType: CI, article: "1조", title: "제1조(법원)", content: ["민사에 관하여 법률에 규정이 없으면 관습법에 의하고 관습법이 없으면 조리에 의한다."]),
    LawItem(lawType: CI, article: "2조", title: "제2조(신의성실)", content: ["① 권리의 행사와 의무의 이행은 신의에 좇아 성실히 하여야 한다.", "② 권리는 남용하지 못한다."]),
    LawItem(lawType: CI, article: "3조", title: "제3조(권리능력의 존속기간)", content: ["사람은 생존한 동안 권리와 의무의 주체가 된다."]),
    LawItem(lawType: CI, article: "4조", title: "제4조(성년)", content: ["사람은 19세로 성년에 이르게 된다."]),
    LawItem(lawType: CI, article: "5조", title: "제5조(미성년자의 능력)", content: ["① 미성년자가 법률행위를 함에는 법정대리인의 동의를 얻어야 한다. 그러나 권리만을 얻거나 의무만을 면하는 행위는 그러하지 아니하다.", "② 전항의 규정에 위반한 행위는 취소할 수 있다."])
]
