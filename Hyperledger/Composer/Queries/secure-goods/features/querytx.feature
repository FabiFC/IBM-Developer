#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Feature: QuerySecurity

    Background:
        Given I have deployed the business network definition ..
        And I have added the following participants of type com.makotogo.learn.composer.securegoods.participant.Buyer
            | username   | fullName |
            | buy001 | Buyer1 |
            | buy002 | Buyer2 |
        And I have added the following participants of type com.makotogo.learn.composer.securegoods.participant.Seller
            | username   | fullName |
            | sell001 | Seller1 |
            | sell002 | Seller2 |
        And I have added the following participants of type com.makotogo.learn.composer.securegoods.participant.Shipper
            | username   | fullName |
            | ship001 | Shipper1 |
            | ship002 | Shipper2 |
        And I have added the following assets of type com.makotogo.learn.composer.securegoods.asset.OrderSequence
            | id | nextId |
            | ORDER_SEQ | 100 |
        And I have added the following assets of type com.makotogo.learn.composer.securegoods.asset.Item
            | id | sku | description |
            | WIDGET001 | W001 | Widget number 1 |
            | WIDGET002 | W002 | Widget number 2 |
        And I have added the following assets
        """
        [
            {
                "$class": "com.makotogo.learn.composer.securegoods.asset.Order",
                "id": "ORD0000001",
                "item": "WIDGET001",
                "quantity": "1000",
                "unitCost": {
                    "$class": "com.makotogo.learn.composer.securegoods.common.Price",
                    "currency": "USD", "amount": "1.5" 
                },
                "buyer": "buy001",
                "seller": "sell001",
                "shipper": "ship001",
                "shippingCost": {
                    "$class": "com.makotogo.learn.composer.securegoods.common.Price",
                    "currency": "USD", "amount": "100" 
                },
                "status": "CREATED"
            },
            {
                "$class": "com.makotogo.learn.composer.securegoods.asset.Order",
                "id": "ORD0000100",
                "item": "WIDGET001",
                "quantity": "1000",
                "unitCost": {
                    "$class": "com.makotogo.learn.composer.securegoods.common.Price",
                    "currency": "USD", "amount": "1.5" 
                },
                "buyer": "buy001",
                "seller": "sell001",
                "shipper": "ship001",
                "shippingCost": {
                    "$class": "com.makotogo.learn.composer.securegoods.common.Price",
                    "currency": "USD", "amount": "100" 
                },
                "status": "CREATED"
            }
        ]
        """
        And I have issued the participant com.makotogo.learn.composer.securegoods.participant.Buyer#buy001 with the identity BUYER001
        And I have issued the participant com.makotogo.learn.composer.securegoods.participant.Buyer#buy002 with the identity BUYER002
        And I have issued the participant com.makotogo.learn.composer.securegoods.participant.Seller#sell001 with the identity SELLER001
        And I have issued the participant com.makotogo.learn.composer.securegoods.participant.Seller#sell002 with the identity SELLER002
        And I have issued the participant com.makotogo.learn.composer.securegoods.participant.Shipper#ship001 with the identity SHIPPER001
        And I have issued the participant com.makotogo.learn.composer.securegoods.participant.Shipper#ship002 with the identity SHIPPER002

    Scenario: Buyer 1 can invoke the FindOrdersForBuyer transaction
        When I use the identity BUYER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForBuyer
            | buyerId |
            | buy001  |

    Scenario: Seller 1 can invoke the FindOrdersForBuyer transaction
        When I use the identity SELLER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForBuyer
            | buyerId |
            | buy001  |

    Scenario: Shipper 1 can invoke the FindOrdersForBuyer transaction
        When I use the identity SHIPPER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForBuyer
            | buyerId |
            | buy001  |

    Scenario: Seller 1 can invoke the FindOrdersForSeller transaction
        When I use the identity SELLER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForSeller
            | sellerId |
            | sell001  |

    Scenario: Buyer 1 can invoke the FindOrdersForSeller transaction
        When I use the identity BUYER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForSeller
            | sellerId |
            | sell001  |

    Scenario: Shipper 1 can invoke the FindOrdersForSeller transaction
        When I use the identity SHIPPER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForSeller
            | sellerId |
            | sell001  |

    Scenario: Shipper 1 can invoke the FindOrdersForShipper transaction
        When I use the identity SHIPPER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForShipper
            | shipperId |
            | ship001  |

    Scenario: Buyer 1 can invoke the FindOrdersForShipper transaction
        When I use the identity BUYER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForShipper
            | shipperId |
            | ship001  |

    Scenario: Seller 1 can invoke the FindOrdersForShipper transaction
        When I use the identity SELLER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersForShipper
            | shipperId |
            | ship001  |

    Scenario: Buyer 1 can invoke the FindOrdersByItem transaction
        When I use the identity BUYER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersByItem
            | itemId |
            | WIDGET001  |

    Scenario: Buyer 1 can invoke the FindOrdersByCurrencyCode transaction
        When I use the identity BUYER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersByCurrencyCode
            | currencyCode |
            | USD          |

    Scenario: Seller 1 can invoke the FindOrdersByItem transaction
        When I use the identity SELLER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersByItem
            | itemId |
            | WIDGET001  |

    Scenario: Seller 1 can invoke the FindOrdersByCurrencyCode transaction
        When I use the identity SELLER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersByCurrencyCode
            | currencyCode |
            | USD          |

    Scenario: Shipper 1 can invoke the FindOrdersByItem transaction
        When I use the identity SHIPPER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersByItem
            | itemId |
            | WIDGET001  |

    Scenario: Shipper 1 can invoke the FindOrdersByCurrencyCode transaction
        When I use the identity SHIPPER001
        And I submit the following transaction of type com.makotogo.learn.composer.securegoods.querytx.FindOrdersByCurrencyCode
            | currencyCode |
            | USD          |

    Scenario: Buyer 1 cannot invoke the FindAllHistory transaction
        When I use the identity BUYER001
        And I submit the following transaction
        """
        {
            "$class": "com.makotogo.learn.composer.securegoods.querytx.FindAllHistory"
        }
        """
        Then I should get an error matching /does not have .* access to resource/

    Scenario: Buyer 1 cannot invoke the FindOrderHistory transaction
        When I use the identity BUYER001
        And I submit the following transaction
        """
        {
            "$class": "com.makotogo.learn.composer.securegoods.querytx.FindOrderHistory"
        }
        """
        Then I should get an error matching /does not have .* access to resource/

    Scenario: Seller 1 cannot invoke the FindAllHistory transaction
        When I use the identity SELLER001
        And I submit the following transaction
        """
        {
            "$class": "com.makotogo.learn.composer.securegoods.querytx.FindAllHistory"
        }
        """
        Then I should get an error matching /does not have .* access to resource/

    Scenario: Seller 1 cannot invoke the FindOrderHistory transaction
        When I use the identity SELLER001
        And I submit the following transaction
        """
        {
            "$class": "com.makotogo.learn.composer.securegoods.querytx.FindOrderHistory"
        }
        """
        Then I should get an error matching /does not have .* access to resource/

    Scenario: Shipper 1 cannot invoke the FindAllHistory transaction
        When I use the identity SHIPPER001
        And I submit the following transaction
        """
        {
            "$class": "com.makotogo.learn.composer.securegoods.querytx.FindAllHistory"
        }
        """
        Then I should get an error matching /does not have .* access to resource/

    Scenario: Shipper 1 cannot invoke the FindOrderHistory transaction
        When I use the identity SHIPPER001
        And I submit the following transaction
        """
        {
            "$class": "com.makotogo.learn.composer.securegoods.querytx.FindOrderHistory"
        }
        """
        Then I should get an error matching /does not have .* access to resource/

