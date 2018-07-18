//
//  PurchaseViewModel+Intent.swift
//  MilkshakrKit
//
//  Created by Guilherme Rambo on 12/06/18.
//  Copyright © 2018 Guilherme Rambo. All rights reserved.
//

import UIKit
import Intents

@available(iOSApplicationExtension 12.0, *)
public extension Product {

    var intentObject: INObject {
        return INObject(identifier: identifier, display: name)
    }

}

@available(iOSApplicationExtension 12.0, *)
public extension PurchaseViewModel {

    var intent: OrderMilkshakeIntent {
        let result = OrderMilkshakeIntent()

        result.suggestedInvocationPhrase = NSString.deferredLocalizedIntentsString(with: "Order %@", product.name) as String
        result.product = product.intentObject

        return result
    }

    var interaction: INInteraction {
        return INInteraction(intent: intent, response: nil)
    }

}
