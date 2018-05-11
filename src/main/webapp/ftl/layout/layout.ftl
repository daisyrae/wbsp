<#macro layout menu_index>
    <!doctype html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>后台管理系统</title>
        <meta name="keywords" content="index">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="renderer" content="webkit">
        <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css">
        <link rel="stylesheet" href="${ctx}/assets/css/admin.css">
        <link rel="stylesheet" href="${ctx}/assets/css/app.css">
        <link rel="stylesheet" href="${ctx}/assets/css/amazeui.datatables.css">
        <script src="${ctx}/assets/js/jquery.min.js"></script>
        <script src="${ctx}/assets/js/amazeui.datatables.min.js"></script>
        <#--<script type="text/javascript" src="${ctx}/assets/js/jquery.dataTables.min.js"></script>-->
    </head>
    <body data-type="index">
        <!-- 头部引用 -->
        <#import "${ctx}/layout/header.ftl" as header>
        <@header.header>
        </@header.header>
        <!-- 菜单及中间部分引用 -->
        <div class="tpl-page-container tpl-page-header-fixed">
            <!-- 菜单栏引用 -->
            <#import "${ctx}/layout/sidebar.ftl" as sidebar>
            <@sidebar.sidebar menu_index>
            </@sidebar.sidebar>
            <!-- 中间部分 -->
            <div class="tpl-content-wrapper">
                <#nested>
            </div>
        </div>
        <!-- 底部引用 -->
        <#import "${ctx}/layout/footer.ftl" as footer>
        <@footer.footer>
        </@footer.footer>
    </body>
    </html>
</#macro>