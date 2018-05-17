<#assign ctx=request.getContextPath()/>
<#import "${ctx}/layout/layout.ftl" as layout>
<@layout.layout 0>
            <div class="tpl-content-scope">
                <div class="note note-info">
                    <h3>微商服务管理平台
                        <span class="close" data-close="note"></span>
                    </h3>
                    <p>本系统提供微商后台数据管理维护；涵盖商家信息管理、商家产品管理、商家订单查看等功能，入驻商家获得授权账号方可对本系统进行访问。</p>
                    <p><span class="label label-danger">提示：</span>&nbsp;本后台系统为商家管理员进行后台数据维护和查看分析，禁止账号外泄，数据外流。
                    </p>
                </div>
            </div>
            <ol class="am-breadcrumb">
                <li class="am-active am-icon-home">首页</li>
            </ol>
            <div class="row">
                <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                    <div class="dashboard-stat blue">
                        <div class="visual">
                            <i class="am-icon-slideshare"></i>
                        </div>
                        <div class="details">
                            <div class="number" id="total_company"> 0 </div>
                            <div class="desc"> 入驻商家 </div>
                        </div>
                        <a class="more" href="${ctx}/company/manager.do"> 查看
                            <i class="m-icon-swapright m-icon-white"></i>
                        </a>
                    </div>
                </div>
                <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                    <div class="dashboard-stat red">
                        <div class="visual">
                            <i class="am-icon-bar-chart-o"></i>
                        </div>
                        <div class="details">
                            <div class="number" id="total_product"> 0 </div>
                            <div class="desc"> 在线商品 </div>
                        </div>
                        <a class="more" href="${ctx}/product/productManager.do"> 查看
                            <i class="m-icon-swapright m-icon-white"></i>
                        </a>
                    </div>
                </div>
                <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                    <div class="dashboard-stat green">
                        <div class="visual">
                            <i class="am-icon-apple"></i>
                        </div>
                        <div class="details">
                            <div class="number" id="total_customer"> 0 </div>
                            <div class="desc"> 用户量 </div>
                        </div>
                        <a class="more" href="${ctx}/customer/view.do"> 查看
                            <i class="m-icon-swapright m-icon-white"></i>
                        </a>
                    </div>
                </div>
                <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                    <div class="dashboard-stat purple">
                        <div class="visual">
                            <i class="am-icon-android"></i>
                        </div>
                        <div class="details">
                            <div class="number" id="total_order"> 0 </div>
                            <div class="desc"> 总订单 </div>
                        </div>
                        <a class="more" href="${ctx}/order/view.do"> 查看
                            <i class="m-icon-swapright m-icon-white"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="am-u-md-6 am-u-sm-12 row-mb">
                    <div class="tpl-portlet">
                        <div class="tpl-portlet-title">
                            <div class="tpl-caption font-red ">
                                <i class="am-icon-bar-chart"></i>
                                <span> 动态资讯</span>
                            </div>
                            <div class="actions">
                                <ul class="actions-btn">
                                    <li class="purple-on">今日</li>
                                </ul>
                            </div>
                        </div>
                        <div class="tpl-scrollable" style="height: 400px;overflow-y: auto;">
                            <div class="number-stats">
                                <div class="stat-number am-fl am-u-md-6">
                                    <div class="title am-text-right"> 订单量 </div>
                                    <div class="number am-text-right am-text-warning" id="day_order_num"><i class="am-icon-asterisk"></i> 0 </div>
                                </div>
                                <div class="stat-number am-fr am-u-md-6">
                                    <div class="title"> 订单总额 </div>
                                    <div class="number am-text-success" id="day_order_price"><i class="am-icon-jpy"></i> 0 </div>
                                </div>
                            </div>
                            <table class="am-table tpl-table">
                                <thead>
                                <tr class="tpl-table-uppercase">
                                    <th>商家</th>
                                    <th>订单量</th>
                                    <th>订单总额</th>
                                    <th>占比</th>
                                </tr>
                                </thead>
                                <tbody id="main_tbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="am-u-md-6 am-u-sm-12 row-mb">
                    <div class="tpl-portlet">
                        <div class="tpl-portlet-title">
                            <div class="tpl-caption font-green ">
                                <span>项目进度</span>
                            </div>
                        </div>
                        <div class="am-tabs tpl-index-tabs" data-am-tabs>
                            <ul class="am-tabs-nav am-nav am-nav-tabs">
                                <li class="am-active"><a href="#tab1">进行中</a></li>
                                <li><a href="#tab2">已完成</a></li>
                            </ul>
                            <div class="am-tabs-bd">
                                <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                    <ul class="tpl-task-list tpl-task-remind" style="height: 400px;overflow-y: auto;">

                                    </ul>
                                </div>
                                <div class="am-tab-panel am-fade" id="tab2">
                                    <ul class="tpl-task-list tpl-task-remind" style="height: 400px;overflow-y: auto;">

                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    //初始化首页数据
                    $.ajax({
                        url: '${ctx}/homeData/selectHomeData.do',
                        type: 'POST',
                        dataType:"json",
                        success: function (res) {
                            if (res.code === 200) {
                                console.log(res);
                                var homeData=res.data;
                                $("#total_company").html(homeData.totalCompany);
                                $("#total_product").html(homeData.totalProduct);
                                $("#total_customer").html(homeData.totalCustomer);
                                $("#total_order").html(homeData.totalOrder);
                                $("#day_order_num").html('<i class="am-icon-asterisk"></i> '+homeData.dayOrderTotalNum+' ');
                                $("#day_order_price").html('<i class="am-icon-jpy"></i> '+homeData.dayOrderTotalPrice+' ');
                                if(homeData.newsInfoModels&&homeData.newsInfoModels.length>0){
                                    var $mainTbody=$("#main_tbody");
                                    $mainTbody.empty();
                                    var newsInfos=homeData.newsInfoModels;
                                    $.each(newsInfos,function (i,item) {
                                        $mainTbody.append(
                                                '<tr>' +
                                                    '<td>' +
                                                        '<img src="'+item.companyLogo+'" class="user-pic">' +
                                                        '<span class="user-name">'+item.companyName+'</span>' +
                                                    '</td>' +
                                                    '<td>'+item.orderNum+'</td>' +
                                                    '<td>￥'+item.orderPrice+'</td>' +
                                                    '<td class="font-green bold">'+item.orderRate+'%</td>' +
                                                '</tr>');
                                    });
                                }
                                if(homeData.orderNewsModels&&homeData.orderNewsModels.length>0){
                                    var $tab1_ul=$("#tab1").find('ul');
                                    $tab1_ul.empty();
                                    var orderNews=homeData.orderNewsModels;
                                    $.each(orderNews,function (i,item) {
                                        $tab1_ul.append(
                                                '<li>' +
                                                    '<div class="cosB">'+item.orderTime+'</div>' +
                                                    '<div class="cosA">' +
                                                        '<span class="cosIco">' +
                                                            '<i class="am-icon-bell-o"></i>' +
                                                        '</span>' +
                                                        '<span>'+item.orderDesc+'</span>' +
                                                    '</div>' +
                                                '</li>');
                                    });
                                }
                            }
                        }
                    });
                });
            </script>
</@layout.layout>