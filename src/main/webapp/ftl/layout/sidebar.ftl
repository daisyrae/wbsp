<#macro sidebar menu_index>
    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-title">菜单列表</div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/index.do" class="nav-link ${(menu_index==0)?string('active','')}">
                        <i class="am-icon-home"></i>
                        <span>首页</span>
                        <#if menu_index==0>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </#if>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/user/manager.do" class="nav-link ${(menu_index==1)?string('active','')}">
                        <i class="am-icon-user"></i>
                        <span>用户管理</span>
                        <#if menu_index==1>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </#if>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-table"></i>
                        <span>表格</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu">
                        <li>
                            <a href="table-font-list.html">
                                <i class="am-icon-angle-right"></i>
                                <span>文字表格</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>

                            <a href="table-images-list.html">
                                <i class="am-icon-angle-right"></i>
                                <span>图片表格</span>
                                <i class="tpl-left-nav-content tpl-badge-success">
                                    18
                                </i>

                                <a href="form-news.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>消息列表</span>
                                    <i class="tpl-left-nav-content tpl-badge-primary">
                                        5
                                    </i>


                                    <a href="form-news-list.html">
                                        <i class="am-icon-angle-right"></i>
                                        <span>文字列表</span>

                                    </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</#macro>