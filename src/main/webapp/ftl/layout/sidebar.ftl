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
                    <a href="${ctx}/company/manager.do" class="nav-link ${(menu_index==1)?string('active','')}">
                        <i class="am-icon-slideshare"></i>
                        <span>商家管理</span>
                        <#if menu_index==1>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </#if>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/user/manager.do" class="nav-link ${(menu_index==2)?string('active','')}">
                        <i class="am-icon-user"></i>
                        <span>用户管理</span>
                        <#if menu_index==2>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </#if>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/product/productCategoryManager.do" class="nav-link ${(menu_index==3)?string('active','')}">
                        <i class="am-icon-tag"></i>
                        <span>商品类目管理</span>
                        <#if menu_index==3>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </#if>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/product/productAttributeManager.do" class="nav-link ${(menu_index==4)?string('active','')}">
                        <i class="am-icon-yelp"></i>
                        <span>商品属性管理</span>
                        <#if menu_index==4>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </#if>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</#macro>