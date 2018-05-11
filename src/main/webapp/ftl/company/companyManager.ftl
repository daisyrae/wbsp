<#assign ctx=request.getContextPath()/>
<#import "${ctx}/layout/layout.ftl" as layout>
<@layout.layout 1>
    <ol class="am-breadcrumb">
        <li><a href="${ctx}/index.do" class="am-icon-home">首页</a></li>
        <li class="am-active">商家管理</li>
    </ol>
    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
                            <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                            <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                            <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tpl-block">
            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form">
                        <table class="am-table am-table-striped am-table-hover table-main" id="sampleTable">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>名称</th>
                                <th>类型</th>
                                <th>地址</th>
                                <th>LOGO</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                        </table>
                    </form>
                </div>

            </div>
        </div>
        <div class="tpl-alert"></div>
    </div>
    <script>
        $(function () {
            //初始化加载表格
            $('#sampleTable').dataTable({
                'searching' : false,
                'bLengthChange': false,
                // 开启服务器模式
                'serverSide': false,
                'ordering': false,
                'ajax': {
                    url: '${ctx}/company/selectAll.do',
                    type: "POST"
                },
                'columns': [
                    {'data': null},
                    {'data': 'name'},
                    {'data': 'define'},
                    {'data': 'address'},
                    {'data': 'logo'},
                    {
                        'data':
                                function (row) {
                                    return '<button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                                            '<button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>';
                                }
                    }
                ],
                "fnDrawCallback": function () {
                    this.api().column(0).nodes().each(function (cell, i) {
                        cell.innerHTML = i + 1;
                    });
                }
            });
        });
    </script>
</@layout.layout>