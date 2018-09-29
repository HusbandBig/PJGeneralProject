//
//  UFDataManage.m
//  MemberShip
//
//  Created by 张佩金 on 2017/7/1.
//  Copyright © 2017年 unitedfitness. All rights reserved.
//

#import "FMDBSaveDataManager.h"
#import "FMDBSaveDataSuperModel.h"

static FMDBSaveDataManager *_manager = nil;
static FMDatabaseQueue *_dbQueue;

@interface FMDBSaveDataManager ()

@end

@implementation FMDBSaveDataManager
{
    NSString *_path;
}
#pragma mark - 创建数据库管理者
+ (instancetype)shareInstance{
    
    if (_manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _manager = [[FMDBSaveDataManager alloc] init];
        });
    }
   
    return _manager;
}

#pragma mark - 创建数据库
- (void)shareSQLWithName:(NSString *)sqlName{
    
    
    //获取路径
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/%@.sqlite",sqlName]];
    _path = path;
    _dbQueue =  [FMDatabaseQueue databaseQueueWithPath:path];
    
    
}

#pragma mark - 数据库路径
- (NSString *)sqlPath{
    return _path;
}

#pragma mark - 创建数据库表
- (void)createDataBaseWithTableName:(NSString *)tableName keyWords:(NSArray <NSString *> *)keyWords
{
    [[NSUserDefaults standardUserDefaults] setObject:keyWords forKey:tableName];
    
    NSString *ziduan = @"ID integer primary key autoincrement";
    for (NSString *keyWord in keyWords) {
        ziduan = [ziduan stringByAppendingString:[NSString stringWithFormat:@", %@ text",keyWord]];
    }
    NSString *table = [NSString stringWithFormat:@"create table if not exists %@(%@);",tableName,ziduan];
    [_dbQueue inDatabase:^(FMDatabase *db) {
       
        [db executeUpdate:table];
        
    }];
    
    
}

#pragma mark - 是否存在表
- (BOOL)isExistTable:(NSString *)tableName
{
    __block BOOL isExistTable = NO;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *set = [db executeQuery:[NSString stringWithFormat:@"select name from sqlite_master where type = 'table' and name = '%@'",tableName]];
        while ([set next]) {
            if ([[set stringForColumn:@"name"] isEqualToString:tableName])
            {
                isExistTable = YES;
            }
        }
        [set close];
        
    }];
    
    return isExistTable;
}


#pragma mark - 增加表的字段
- (void)updateTableWithTableName:(NSString *)tableName word:(NSString *)word{
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        if (![db columnExists:word inTableWithName:tableName]) {
            NSString *insert =[NSString stringWithFormat:@"ALTER TABLE %@ ADD %@ TEXT",tableName,word];
            [db executeUpdate:insert];
        }
    }];
    
}


#pragma mark - 添加数据
- (void)addDataToTable:(NSString *)tableName addData:(FMDBSaveDataSuperModel *)model{
    
    NSArray *keyWords = [[NSUserDefaults standardUserDefaults] objectForKey:tableName];
    NSString *ziduan =@"";
    NSString *vlaues =@"";
    for (NSInteger i=0 ;i<keyWords.count;i++) {
        NSString *keyWord = keyWords[i];
        
        if (i == keyWords.count-1) {
            ziduan = [ziduan stringByAppendingString:keyWord];
            vlaues = [vlaues stringByAppendingString:@"?"];
        }else{
            ziduan = [ziduan stringByAppendingString:[NSString stringWithFormat:@"%@,",keyWord]];
            vlaues = [vlaues stringByAppendingString:@"?,"];
        }
    }
    NSString *addString = [NSString stringWithFormat:@"insert into %@(%@) values(%@);",tableName,ziduan,vlaues];
          //判断那个表;  因为下面的那个model的对应才行
    if ([tableName isEqualToString:@"UPDateTimeTable"]) { //更新 时间表
//        UFUPDateTimeModel *m = (UFUPDateTimeModel *)model;
//        [_dbQueue inDatabase:^(FMDatabase *db) {
//            [db executeUpdate:addString,m.userGuid,m.userToken,m.updateName,m.updateTime];
//        }];
    }
    
}


#pragma mark - 删除数据
- (void)deleteDataFromTable:(NSString *)tableName deleteData:(FMDBSaveDataSuperModel *)model{
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        
        [db executeUpdate:[NSString stringWithFormat:@"delete from %@ where ID = ?",tableName],model.ID];
        
    }];
}

- (void)deleteAllDataFromTable:(NSString *)tableName{
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:[NSString stringWithFormat:@"DELETE FROM %@",tableName]];
        [db executeUpdate:[NSString stringWithFormat:@"DELETE FROM sqlite_sequence WHERE name = '%@'",tableName]];
        
    }];
}



#pragma mark - 修改数据
- (void)changeDataFromTable:(NSString *)tableName changeData:(FMDBSaveDataSuperModel *)model{
    NSArray *keyWords = [[NSUserDefaults standardUserDefaults] objectForKey:tableName];
    NSString *ziduan =@"";
    for (NSInteger i=0 ;i<keyWords.count;i++) {
        NSString *keyWord = keyWords[i];
        if (i == keyWords.count-1) {
            ziduan = [ziduan stringByAppendingString:[NSString stringWithFormat:@"%@ = ?",keyWord]];
        }else{
            ziduan = [ziduan stringByAppendingString:[NSString stringWithFormat:@"%@ = ?,",keyWord]];
            
        }
    }
    NSString *changeString = [NSString stringWithFormat:@"update %@ set %@ where ID = ?",tableName,ziduan];
        //判断那个表
    //判断那个表
    if ([tableName isEqualToString:@"UPDateTimeTable"]) { //更新 时间表
        //        UFUPDateTimeModel *m = (UFUPDateTimeModel *)model;
        //        [_dbQueue inDatabase:^(FMDatabase *db) {
        //            [db executeUpdate:changeString,m.userGuid,m.userToken,m.updateName,m.updateTime,m.ID];           //   update table0 set Name = ？,age = ？,name2 = ？ where ID = ?
        //        }];
    }
    
    
    
}



#pragma mark - 获取所有数据
- (NSArray *)getAllDataFromTable:(NSString *)tableName{
    
    NSMutableArray *allData = [NSMutableArray array];
    NSArray *keyWords = [[NSUserDefaults standardUserDefaults] objectForKey:tableName];
    
    //判断那个表
    if ([tableName isEqualToString:@"UPDateTimeTable"]) {//更新 时间表
//        [_dbQueue inDatabase:^(FMDatabase *db) {
//            FMResultSet *set = [db executeQuery:[NSString stringWithFormat:@"select * from %@",tableName]];
//            while ([set next]) {
//                UFUPDateTimeModel *m = [[UFUPDateTimeModel alloc] init];
//                m.userGuid = [set stringForColumn:keyWords[0]];
//                m.userToken = [set stringForColumn:keyWords[1]];
//                m.updateName = [set stringForColumn:keyWords[2]];
//                m.updateTime = [set stringForColumn:keyWords[3]];
//                m.ID = [NSNumber numberWithInteger:[set intForColumn:@"ID"]];
//                [allData addObject:m];
//            }
//            [set close];
//        }];
    }
    
     return allData;
    
}



@end
