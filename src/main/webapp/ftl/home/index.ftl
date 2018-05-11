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
                            <i class="am-icon-comments-o"></i>
                        </div>
                        <div class="details">
                            <div class="number"> 1349 </div>
                            <div class="desc"> 新消息 </div>
                        </div>
                        <a class="more" href="#"> 查看更多
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
                            <div class="number"> 62% </div>
                            <div class="desc"> 收视率 </div>
                        </div>
                        <a class="more" href="#"> 查看更多
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
                            <div class="number"> 653 </div>
                            <div class="desc"> 苹果设备 </div>
                        </div>
                        <a class="more" href="#"> 查看更多
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
                            <div class="number"> 786 </div>
                            <div class="desc"> 安卓设备 </div>
                        </div>
                        <a class="more" href="#"> 查看更多
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
                                <span> Cloud 动态资料</span>
                            </div>
                            <div class="actions">
                                <ul class="actions-btn">
                                    <li class="purple-on">昨天</li>
                                    <li class="green">前天</li>
                                    <li class="dark">本周</li>
                                </ul>
                            </div>
                        </div>
                        <div class="tpl-scrollable">
                            <div class="number-stats">
                                <div class="stat-number am-fl am-u-md-6">
                                    <div class="title am-text-right"> Total </div>
                                    <div class="number am-text-right am-text-warning"> 2460 </div>
                                </div>
                                <div class="stat-number am-fr am-u-md-6">
                                    <div class="title"> Total </div>
                                    <div class="number am-text-success"> 2460 </div>
                                </div>

                            </div>

                            <table class="am-table tpl-table">
                                <thead>
                                <tr class="tpl-table-uppercase">
                                    <th>人员</th>
                                    <th>余额</th>
                                    <th>次数</th>
                                    <th>效率</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <img src="assets/img/user01.png" alt="" class="user-pic">
                                        <a class="user-name" href="###">禁言小张</a>
                                    </td>
                                    <td>￥3213</td>
                                    <td>65</td>
                                    <td class="font-green bold">26%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="assets/img/user02.png" alt="" class="user-pic">
                                        <a class="user-name" href="###">Alex.</a>
                                    </td>
                                    <td>￥2635</td>
                                    <td>52</td>
                                    <td class="font-green bold">32%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="assets/img/user03.png" alt="" class="user-pic">
                                        <a class="user-name" href="###">Tinker404</a>
                                    </td>
                                    <td>￥1267</td>
                                    <td>65</td>
                                    <td class="font-green bold">51%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="assets/img/user04.png" alt="" class="user-pic">
                                        <a class="user-name" href="###">Arron.y</a>
                                    </td>
                                    <td>￥657</td>
                                    <td>65</td>
                                    <td class="font-green bold">73%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="assets/img/user05.png" alt="" class="user-pic">
                                        <a class="user-name" href="###">Yves</a>
                                    </td>
                                    <td>￥3907</td>
                                    <td>65</td>
                                    <td class="font-green bold">12%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="assets/img/user06.png" alt="" class="user-pic">
                                        <a class="user-name" href="###">小黄鸡</a>
                                    </td>
                                    <td>￥900</td>
                                    <td>65</td>
                                    <td class="font-green bold">10%</td>
                                </tr>
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
                                    aaaaa
                                </div>
                                <div class="am-tab-panel am-fade" id="tab2">
                                    bbbbbbbb
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
</@layout.layout>