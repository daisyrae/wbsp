<#assign ctx=request.contextPath/>
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
                        <table style="width: 100%;" class="am-table table-main" id="sampleTable">
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
    </div>
    <div class="am-modal am-modal-no-btn" id="form-modal">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">商家信息
                <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
            </div>
            <div class="am-modal-bd">
                <div class="tpl-block ">
                    <div class="am-g tpl-amazeui-form">
                        <form class="am-form am-form-horizontal" id="company-edit-form" method="post" enctype="multipart/form-data" data-am-validator>
                            <input type="hidden" name="id">
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">名称</label>
                                <div class="am-u-sm-10">
                                    <input name="name" placeholder="输入商家名称" type="text" required>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">类型</label>
                                <div class="am-u-sm-10">
                                    <select name="define" required>
                                        <option value="1">自营</option>
                                        <option value="2">代理</option>
                                        <option value="3">连锁</option>
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label lass="am-u-sm-2 am-form-label">LOGO</label>
                                <div class="am-u-sm-10">
                                    <div class="am-form-group am-form-file">
                                        <button type="button" class="am-btn am-btn-secondary am-btn-sm" style="width: 100%;">
                                            <i class="am-icon-cloud-upload" style="color: white;"></i>选择logo图
                                        </button>
                                        <input type="file" id="logoFile" name="logoFile">
                                    </div>
                                    <div class="am-modal-hd" id="img-file-list">
                                    </div>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">地址</label>
                                <div class="am-u-sm-10">
                                    <textarea rows="5" name="address" placeholder="输入商家联系地址" required></textarea>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-12">
                                    <button type="button" class="am-btn am-btn-success" onclick="saveCompany()">保存</button>
                                    <button type="button" class="am-btn am-btn-default" data-am-modal-close>取消</button>
                                </div>
                            </div>
                        </form>
                    </div>
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
                    url: '${ctx}/company/selectAll.do',
                    type: "POST"
                },
                'columns': [
                    {'data': null},
                    {'data': 'name'},
                    {
                        'data': function (row) {
                            if(row.define === 1){
                                return '自营';
                            }else if(row.define === 2){
                                return '代理';
                            }else{
                                return '连锁';
                            }
                        }
                    },
                    {'data': 'address'},
                    {
                        'data': function (row) {
                            if(row.logo){
                                return '<img class="am-circle" width="120" height="120" src="${ctx}'+row.logo+'"/>';
                            }else{
                                return '';
                            }
                        }
                    },
                    {
                        'data':
                                function (row) {
                                    return '<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="editCompany('+row.id+')"><span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                                            '<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteCompany('+row.id+')"><span class="am-icon-trash-o"></span> 删除</button>';
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

        //新增按钮点击事件
        $(".btn-add").click(function () {
            var $modal = $('#form-modal');
            var $form=$("#company-edit-form");
            $modal.modal();
            $form.clear();
            var $preDiv=$("#img-file-list");
            $preDiv.empty();
        });

        //编辑公司信息
        function editCompany(id){
            var $modal = $('#form-modal');
            var $form=$("#company-edit-form");
            $.ajax({
                url: '${ctx}/company/findCompany.do',
                type: 'POST',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function (res) {
                    if (res.code === 200) {
                        $modal.modal();
                        $form.fill(res.data);
                        var $preDiv=$("#img-file-list");
                        $preDiv.empty();
                        if(res.data.logo){
                            $preDiv.append('<img class="am-circle" width="120" height="120" style="margin: 20px;" src="'+res.data.logo+'"/>');
                            $preDiv.append('<a href="javascript: void(0)" onclick="deleteSelectedImg()" class="am-close am-close-spin" style="position: absolute;top: 50px;right: 15px;">&times;</a>');
                        }
                    }
                }
            });
        }

        //文件选择改变事件
        $("#logoFile").change(function () {
            var objUrl=getObjectURL(this.files[0]);
            var $preDiv=$("#img-file-list");
            $preDiv.empty();
            $preDiv.append('<img class="am-circle" width="120" height="120" style="margin: 20px;" src="'+objUrl+'"/>');
            $preDiv.append('<a href="javascript: void(0)" onclick="deleteSelectedImg()" class="am-close am-close-spin" style="position: absolute;top: 50px;right: 15px;">&times;</a>');
        });

        //删除已上传的图片
        function deleteSelectedImg(){
            var $preDiv=$("#img-file-list");
            $preDiv.empty();
        }

        //获取临时上传文件路径
        function getObjectURL(file){
            var url=null;
            if(window.createObjectURL!==undefined){
                url=window.createObjectURL(file);
            }else if(window.URL!==undefined){
                url=window.URL.createObjectURL(file);
            }else if (window.webkitURL !== undefined) {
                url=window.webkitURL.createObjectURL(file);
            }
            return url;
        }

        //保存模态框信息按钮点击事件
        function saveCompany(){
            var $form=$("#company-edit-form");
            var $modal = $('#form-modal');
            var isValidator=$form.data('amui.validator').isFormValid();
            if(isValidator){
                $form.ajaxSubmit({
                    url: '${ctx}/company/saveCompany.do',
                    type: 'POST',
                    dataType: 'json',
                    success: function (res) {
                        if (res.code === 200) {
                            $modal.modal('close');
                            $modal.removeData('amui.modal');
                            reloadDataTable();
                        }
                    }
                });
                return false;
            }
        }

        //删除
        function deleteCompany(id){
            var $model=$('#delete-confirm');
            $model.modal({
                relatedTarget: this,
                onConfirm: function() {
                    $.ajax({
                        url: '${ctx}/company/deleteCompany.do',
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