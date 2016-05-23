//
//  Information+CoreDataProperties.h
//  易持家
//
//  Created by 王木木 on 16/5/23.
//  Copyright © 2016年 王木木. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Information.h"

NS_ASSUME_NONNULL_BEGIN

@interface Information (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *ids;
@property (nullable, nonatomic, retain) NSString *creatTime;
@property (nullable, nonatomic, retain) NSString *xfTime;
@property (nullable, nonatomic, retain) NSString *zsMoney;
@property (nullable, nonatomic, retain) NSString *zsNote;
@property (nullable, nonatomic, retain) NSString *zwMoney;
@property (nullable, nonatomic, retain) NSString *zwNote;
@property (nullable, nonatomic, retain) NSString *wsMoney;
@property (nullable, nonatomic, retain) NSString *wsNote;
@property (nullable, nonatomic, retain) NSString *zjeMoney;
@property (nullable, nonatomic, retain) NSString *xfAllMoney;
@property (nullable, nonatomic, retain) NSString *syMoney;

@end

NS_ASSUME_NONNULL_END
