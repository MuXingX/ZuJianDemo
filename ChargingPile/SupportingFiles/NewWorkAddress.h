//
//  NewWorkAddress.h
//  HomeInnCashier
//
//  Created by MuXingXing on 2018/10/24.
//  Copyright © 2018年 muxingxing. All rights reserved.
//

#ifndef NewWorkAddress_h
#define NewWorkAddress_h



/* 测试环境地址 */
#define MAINURL8080 @"http://10.10.200.128:8080/electric-pile/"
/* 生产环境地址 */
#define ONLINEURL @"http://222.85.161.81:9080/electric-pile/"

/** 获取短信验证码 */
#define sms_code @"sms/code"
/** 注册 */
#define app_register @"app/register"
/** 登陆 */
#define app_login @"app/login"

/** 充电订单列表 */
#define shevcs_query_order_info @"shevcs/v1.0/charge_order_info"
/** 请求设备认证 */
#define shevcs_query_equip_auth @"shevcs/v1.0/query_equip_auth"
/** 查询充电站信息 */
#define shevcs_query_stations_info @"shevcs/v1.0/query_stations_info"
/** 请求启动充电 */
#define shevcs_query_query_start_charge @"shevcs/v1.0/query_start_charge"
/** 请求停止充电 */
#define shevcs_query_query_stop_charge @"shevcs/v1.0/query_stop_charge"
/** 充电中列表 */
#define shevcs_query_start_charge_list @"shevcs/v1.0/start_charge_list"
/** 查询充电状态 */
#define shevcs_query_equip_charge_status @"shevcs/v1.0/query_equip_charge_status"
/** 查询设备实时状态(批量查询) */
#define shevcs_query_station_status @"shevcs/v1.0/query_station_status"

/** 图片拼接地址 */
#define MainImageUrl @"http://10.10.200.149:8082/ejsimage"



/** 判断是否登录 */
#define chain_user_islogin @"chain/user/islogin"
/** 获取门店销售状况 */
#define chain_table_backIndex @"chain/table/backIndex"
/** 获取商品信息 */
#define product_sales @"product/sales"
/** 分页查询商品 */
#define product_page @"product/page"

/** 新增订货单 */
#define call_save @"call/save"
/** 新增订货单 */
#define call_vaild @"call/vaild"
/** 分页查询订货单 */
#define call_page @"call/page"
/** 分页获取订货单商品 */
#define call_products @"call/products"


/** 订货单提交审核 */
#define call_submitAudit @"call/submitAudit"
/** 订货单入库 */
#define call_godown @"call/godown"
/** 更新订单 */
#define call_update @"call/update"

/** 库存 */
#define stock_page @"stock/page"



/** 获取门店角色列表 */
#define system_role_list @"system/role/list"


#endif /* NewWorkAddress_h */
