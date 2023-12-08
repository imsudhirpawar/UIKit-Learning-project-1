//
//  CustomDelegate.swift
//  7Days
//
//  Created by Sudhir Pawar on 07/09/23.
//

import Foundation
import UIKit


    // Define a protocol for the delegate
protocol DataTransferDelegate: AnyObject {
    func didReceivedData(data: String)
}
