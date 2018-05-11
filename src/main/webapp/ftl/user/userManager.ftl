<#assign ctx=request.getContextPath()/>
<#import "${ctx}/layout/layout.ftl" as layout>
<@layout.layout 2>
    <ol class="am-breadcrumb">
        <li><a href="${ctx}/index.do" class="am-icon-home">首页</a></li>
        <li class="am-active">用户管理</li>
    </ol>
</@layout.layout>