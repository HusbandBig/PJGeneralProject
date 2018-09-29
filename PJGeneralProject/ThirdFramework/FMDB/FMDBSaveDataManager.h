//
//  UFDataManage.h
//  MemberShip
//
//  Created by 张佩金 on 2017/7/1.
//  Copyright © 2017年 unitedfitness. All rights reserved.
//

#import "FMDB.h"

/**
 排序
 */
typedef enum {
    Ascending, //升序
    Descending //降序
}SortWay;

@class FMDBSaveDataSuperModel;

@interface FMDBSaveDataManager : NSObject

/**
 数据库的路径
 */
@property (nonatomic, readonly) NSString *sqlPath;



/**
 创建数据库管理者  单例
 */
+ (instancetype)shareInstance;

/**
 创建数据库
 */
- (void)shareSQLWithName:(NSString *)sqlName;

/**
 创建数据库表
 */
- (void)createDataBaseWithTableName:(NSString *)tableName keyWords:(NSArray <NSString *> *)keyWords;

/**
 是否存在表
 */
- (BOOL)isExistTable:(NSString *)tableName;

/**
 增加表的字段
 */
- (void)updateTableWithTableName:(NSString *)tableName word:(NSString *)word;

/**
 添加数据
 */
- (void)addDataToTable:(NSString *)tableName addData:(FMDBSaveDataSuperModel *)model;

/**
 删除数据
 */
- (void)deleteDataFromTable:(NSString *)tableName deleteData:(FMDBSaveDataSuperModel *)model;

/**
 删除所有数据
 */
- (void)deleteAllDataFromTable:(NSString *)tableName;

/**
 修改数据
 */

- (void)changeDataFromTable:(NSString *)tableName changeData:(FMDBSaveDataSuperModel *)model;
/**
 获取所有数据
 */
- (NSArray *)getAllDataFromTable:(NSString *)tableName;




@end
