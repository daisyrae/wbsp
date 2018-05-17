<#assign ctx=request.contextPath/>
<#import "${ctx}/layout/layout.ftl" as layout>
<@layout.layout 3>
    <ol class="am-breadcrumb">
        <li><a href="${ctx}/index.do" class="am-icon-home">首页</a></li>
        <li class="am-active">商品类目维护</li>
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
                                <th>所属商家</th>
                                <th>名称</th>
                                <th>父类目名称</th>
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
            <div class="am-modal-hd">商品类目信息
                <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
            </div>
            <div class="am-modal-bd">
                <div class="tpl-block ">
                    <div class="am-g tpl-amazeui-form">
                        <form class="am-form am-form-horizontal" id="category-form" data-am-validator>
                            <input type="hidden" name="id">
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">所属商家</label>
                                <div class="am-u-sm-10">
                                    <select id="company_select" name="companyId" required>

                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">名称</label>
                                <div class="am-u-sm-10">
                                    <input name="name" placeholder="输入商品类目名称" type="text" required>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">父类目</label>
                                <div class="am-u-sm-10">
                                    <select id="parent_category_select" name="parentId">

                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-12">
                                    <button type="button" class="am-btn am-btn-success" onclick="saveProductCategory()">保存</button>
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
                    url: '${ctx}/product/selectAllProductCategory.do',
                    type: "POST"
                },
                'columns': [
                    {'data': null},
                    {'data': 'companyName'},
                    {'data': 'name'},
                    {'data': 'parentName'},
                    {
                        'data':
                                function (row) {
                                    return '<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="editProductCategory('+row.id+')"><span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                                            '<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteProductCategory('+row.id+')"><span class="am-icon-trash-o"></span> 删除</button>';
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

        //初始化下拉框
        function initModalSelect(id){
            //初始化商家下拉框
            var $companySelect=$("#company_select");
            $companySelect.empty();
            $.ajax({
                url: '${ctx}/company/selectAll.do',
                type: 'POST',
                dataType: 'json',
                success: function (res) {
                    if (res.code === 200&&res.data.length>0) {
                        $.each(res.data,function (i,item) {
                            $companySelect.append('<option value="'+item.id+'">'+item.name+'</option>');
                        });
                    }
                }
            });

            //初始化父类目下拉框
            var $categorySelect=$("#parent_category_select");
            $categorySelect.empty();
            $categorySelect.append('<option value=""></option>');
            $.ajax({
                url: '${ctx}/product/selectAllProductCategoryNoSelf.do',
                type: 'POST',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function (res) {
                    if (res.code === 200&&res.data.length>0) {
                        $.each(res.data,function (i,item) {
                            $categorySelect.append('<option value="'+item.id+'">'+item.name+'</option>');
                        });
                    }
                }
            });
        }

        //新增按钮点击事件
        $(".btn-add").click(function () {
            var $modal = $('#form-modal');
            var $form=$("#category-form");
            $modal.modal();
            $form.clear();
            initModalSelect('');
        });

        //编辑类目
        function editProductCategory(id){
            initModalSelect(id);
            var $modal = $('#form-modal');
            var $form=$("#category-form");
            $.ajax({
                url: '${ctx}/product/findProductCategory.do',
                type: 'POST',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function (res) {
                    if (res.code === 200) {
                        $modal.modal();
                        $form.fill(res.data);
                    }
                }
            });
        }

        //保存模态框信息按钮点击事件
        function saveProductCategory(){
            var $form=$("#category-form");
            var $modal = $('#form-modal');
            var isValidator=$form.data('amui.validator').isFormValid();
            if(isValidator){
                $form.ajaxSubmit({
                    url: '${ctx}/product/saveProductCategory.do',
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
        function deleteProductCategory(id){
            var $model=$('#delete-confirm');
            $model.modal({
                relatedTarget: this,
                onConfirm: function() {
                    $.ajax({
                        url: '${ctx}/product/deleteProductCategory.do',
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