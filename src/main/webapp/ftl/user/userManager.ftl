<#assign ctx=request.getContextPath()/>
<#import "${ctx}/layout/layout.ftl" as layout>
<@layout.layout 2>
    <ol class="am-breadcrumb">
        <li><a href="${ctx}/index.do" class="am-icon-home">首页</a></li>
        <li class="am-active">用户管理</li>
    </ol>
    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default am-btn-success btn-add"><span class="am-icon-plus"></span> 新增</button>
                            <button type="button" class="am-btn am-btn-default am-btn-secondary btn-reflush"><span class="am-icon-refresh"></span> 刷新</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tpl-block">
            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form">
                        <table style="width: 100%;" class="am-table am-table-striped am-table-hover table-main" id="sampleTable">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>所属商家</th>
                                <th>昵称</th>
                                <th>性别</th>
                                <th>电话</th>
                                <th>邮箱</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                        </table>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <div class="am-modal am-modal-confirm" tabindex="-1" id="delete-confirm">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">提示</div>
            <div class="am-modal-bd">确定要删除这条记录吗？</div>
            <div class="am-modal-hd am-modal-bd">
                <button class="am-btn am-btn-danger" data-am-modal-confirm>确定</button>
                <button class="am-btn am-btn-default" data-am-modal-cancel>删除</button>
            </div>
        </div>
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
                    url: '${ctx}/user/selectAll.do',
                    type: "POST"
                },
                'columns': [
                    {'data': null},
                    {'data': 'companyName'},
                    {'data': 'nick'},
                    {
                        'data': function (row) {
                            if(row.sex === 1){
                                return '男';
                            }else if(row.sex === 2){
                                return '女';
                            }else{
                                return '未知';
                            }
                        }
                    },
                    {'data': 'phone'},
                    {'data': 'email'},
                    {
                        'data':
                                function (row) {
                                    return '<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteUser('+row.id+')"><span class="am-icon-trash-o"></span> 删除</button>';
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

        /**
         * 重新加载表格
         */
        function reloadDataTable() {
            $('#sampleTable').DataTable().ajax.reload();
        }

        //刷新按钮点击事件
        $(".btn-reflush").click(function () {
            window.location.reload();
        });

        //删除
        function deleteUser(id){
            var $model=$('#delete-confirm');
            $model.modal({
                relatedTarget: this,
                onConfirm: function() {
                    $.ajax({
                        url: '${ctx}/user/deleteUser.do',
                        type: 'POST',
                        data: {
                            id: id
                        },
                        dataType:"json",
                        success: function (res) {
                            if (res.code === 200) {
                                $model.modal('close');
                                $model.removeData('amui.modal');
                                reloadDataTable();
                            }
                        }
                    });
                },
                closeOnConfirm: false,
                onCancel: function() {
                    $model.modal('close');
                }
            });
        }
    </script>
</@layout.layout>