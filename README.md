#todo
把所有.admin 变成role方式处理,需要结合cancan

改为超级简化版本

1 申请阿里云数据库
2 改变本地deploy文件
3 dump最新数据库结构
4 修改域名

# todo
support progressbar for uploading


重构预订逻辑：
1. admin可以创建可预订资源（人、桌子）
2. 创建预订列表
3. 客户预订，进入排队（可以对资源排队-按摩，也可以作为整体排队-餐馆）
4. 队列中客户状态可以取消，或者转为服务，可以调整队列
5. 服务中的客户可以取消，结束服务
6. 服务需要计时，可以同时开启N个服务（N受资源限制，资源：人，桌子）
6.1 资源有状态，空闲、在忙、已预约
7. 预约需要支付预约费用：0-无限
8. 服务价格模块
8.1 服务价格由N个组合内容构成，技师就是服务套餐，点餐就是菜单
8.2 组合内容可以增减，每个内容都有价格
8.3 可以服务开始前收费，也可以服务结束时收费
8.4 可以有负价格的服务，作为优惠对冲
8.5 可以对总价折扣


#paginate css style
    http://mislav.uniqpath.com/will_paginate/

## act_as_rateable

    # rate for selected post
    @post.rate_it( 4, current_user ) #=> true || false

    # average rating of selected post
    @post.average_rating #=> 4.0
    @post.average_rating_round #=> 4
    @post.average_rating_percent #=> 80

    # check if selected post rated by user
    @post.rated_by?( current_user ) #=> instance of rating model || false

    @post.parse_ratings(:json) #=> JSON formatted string containing the post's ratings

    # find posts with rating '4'
    Post.find_average_of( 4 ) #=> array