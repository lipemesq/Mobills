//
//  Months.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation

enum Months: Int {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    var short: String {
        switch self {
            case .january:
                return "Jan"
            case .february:
                return "Fev"
            case .march:
                return "Mar"
            case .april:
                return "Abr"
            case .may:
                return "Mai"
            case .june:
                return "Jun"
            case .july:
                return "Jul"
            case .august:
                return "Ago"
            case .september:
                return "Set"
            case .october:
                return "Out"
            case .november:
                return "Nov"
            case .december:
                return "Dez"
        }
    }
}
