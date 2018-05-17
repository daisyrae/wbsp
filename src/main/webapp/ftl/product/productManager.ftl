<#assign ctx=request.contextPath/>
<#import "${ctx}/layout/layout.ftl" as layout>
<@layout.layout 5>
    <ol class="am-breadcrumb">
        <li><a href="${ctx}/index.do" class="am-icon-home">首页</a></li>
        <li class="am-active">商品录入</li>
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
                <div class="tpl-table-images" id="product-table-div" style="display: flex;">
                </div>
            </div>
        </div>
    </div>
    <div class="am-modal am-modal-no-btn" id="form-modal">
        <div class="am-modal-dialog" style="width: 50%;">
            <div class="am-modal-hd">商品信息
                <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
            </div>
            <div class="am-modal-bd">
                <div class="tpl-block ">
                    <div class="am-g tpl-amazeui-form">
                        <form class="am-form am-form-horizontal" id="product-edit-form" method="post" enctype="multipart/form-data" data-am-validator>
                            <input type="hidden" name="id">
                            <div class="am-form-group">
                                <label class="am-u-sm-1 am-form-label">商家</label>
                                <div class="am-u-sm-3">
                                    <select id="company_select" name="companyId" required>
                                    </select>
                                </div>
                                <label class="am-u-sm-1 am-form-label">类目</label>
                                <div class="am-u-sm-3">
                                    <select id="category_select" name="categoryId" required>
                                    </select>
                                </div>
                                <label class="am-u-sm-1 am-form-label">属性</label>
                                <div class="am-u-sm-3">
                                    <select id="attribute_select" name="attributeId">
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-u-sm-1 am-form-label">名称</label>
                                <div class="am-u-sm-5">
                                    <input name="name" placeholder="输入商品名称" type="text" required>
                                </div>
                                <label class="am-u-sm-1 am-form-label">价格</label>
                                <div class="am-u-sm-5">
                                    <input name="price" placeholder="输入商品价格" type="text" required>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-u-sm-1 am-form-label">图片</label>
                                <div class="am-u-sm-11">
                                    <div class="am-form-group am-form-file">
                                        <button type="button" class="am-btn am-btn-secondary am-btn-sm" style="width: 100%;">
                                            <i class="am-icon-cloud-upload" style="color: white;"></i>选择商品图片
                                        </button>
                                        <input type="file" id="picFile" name="picFile">
                                    </div>
                                    <div class="am-modal-hd" id="img-file-list">
                                    </div>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-u-sm-1 am-form-label">说明</label>
                                <div class="am-u-sm-11">
                                    <textarea rows="5" name="memo" placeholder="输入商品描述说明" required></textarea>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-12">
                                    <button type="button" class="am-btn am-btn-success" onclick="saveProduct()">保存</button>
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
            <div class="am-modal-bd">确定下架该商品吗？</div>
            <div class="am-modal-hd am-modal-bd">
                <button class="am-btn am-btn-danger" data-am-modal-confirm>确定</button>
                <button class="am-btn am-btn-default" data-am-modal-cancel>删除</button>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            reloadDataTable();
        });

        /**
         * 重新加载表格
         */
        function reloadDataTable() {
            var $mainTableDiv=$("#product-table-div");
            $mainTableDiv.empty();
            //初始化加载数据
            $.ajax({
                url: '${ctx}/product/selectAllProduct.do',
                type: 'POST',
                dataType: 'json',
                success: function (res) {
                    if (res.code === 200&&res.data.length>0) {
                        $.each(res.data,function (i,item) {
                            $mainTableDiv.append(
                                    '<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">' +
                                        '<div class="tpl-table-images-content">' +
                                            '<div class="tpl-table-images-content-i-time">' +
                                                '<span>'+item.name+'</span>' +
                                                '<span class="am-icon-jpy am-text-primary"> '+item.price+'</span>' +
                                            '</div>' +
                                        '<div class="tpl-table-images-content-i">' +
                                            '<img src="'+item.pic+'">' +
                                        '</div>' +
                                        '<div class="tpl-table-images-content-block">' +
                                            '<div class="tpl-i-font">'+item.memo+'</div>' +
                                                '<div class="am-btn-toolbar" style="margin-top: 10px;">' +
                                                    '<div class="am-btn-group am-btn-group-xs tpl-edit-content-btn" style="display: flex;justify-content: flex-end;">' +
                                                        '<button type="button" class="am-btn am-btn-default am-btn-warning" onclick="editProduct('+item.id+')"><span class="am-icon-edit"></span> 编辑</button>' +
                                                        '<button type="button" class="am-btn am-btn-default am-btn-danger" onclick="deleteProduct('+item.id+')"><span class="am-icon-trash-o"></span> 下架</button>' +
                                                    '</div>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>');
                        });
                    }
                }
            });
        }

        //刷新按钮点击事件
        $(".btn-reflush").click(function () {
            window.location.reload();
        });

        //下拉框初始化
        function initModalSelect(){
            //初始化商家下拉框
            var $companySelect=$("#company_select");
            $companySelect.empty();
            $.ajax({
                url: '${ctx}/company/selectAll.do',
                type: 'POST',
                dataType: 'json',
                success: function (res) {
                    if (res.code === 200&&res.data.length>0) {
                        $companySelect.attr('value',res.data[0].id);
                        $.each(res.data,function (i,item) {
                            $companySelect.append('<option value="'+item.id+'">'+item.name+'</option>');
                        });
                        $companySelect.trigger('change');
                    }
                }
            });
        }

        $("#company_select").change(function () {
            var selectCompanyId=$(this).val();
            //初始化类目下拉框
            var $categorySelect=$("#category_select");
            $categorySelect.empty();
            $.ajax({
                url: '${ctx}/product/selectAllProductCategoryByCompanyId.do',
                type: 'POST',
                data: {
                    companyId:selectCompanyId
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
            //初始化属性下拉框
            var $attributeSelect=$("#attribute_select");
            $attributeSelect.empty();
            $.ajax({
                url: '${ctx}/product/selectAllProductAttributeByCompanyId.do',
                type: 'POST',
                data: {
                    companyId:selectCompanyId
                },
                dataType: 'json',
                success: function (res) {
                    if (res.code === 200&&res.data.length>0) {
                        $.each(res.data,function (i,item) {
                            $attributeSelect.append('<option value="'+item.id+'">'+item.name+'</option>');
                        });
                    }
                }
            });
        });

        //新增按钮点击事件
        $(".btn-add").click(function () {
            var $modal = $('#form-modal');
            var $form=$("#product-edit-form");
            $modal.modal();
            $form.clear();
            var $preDiv=$("#img-file-list");
            $preDiv.empty();
            initModalSelect();
        });

        //文件选择改变事件
        $("#picFile").change(function () {
            var objUrl=getObjectURL(this.files[0]);
            var $preDiv=$("#img-file-list");
            $preDiv.empty();
            $preDiv.append('<img class="am-radius" width="240" height="120" style="margin: 20px;" src="'+objUrl+'"/>');
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
        function saveProduct(){
            var $form=$("#product-edit-form");
            var $modal = $('#form-modal');
            var isValidator=$form.data('amui.validator').isFormValid();
            if(isValidator){
                $form.ajaxSubmit({
                    url: '${ctx}/product/saveProduct.do',
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

        //编辑商品
        function editProduct(id){
            var $modal = $('#form-modal');
            var $form=$("#product-edit-form");
            $.ajax({
                url: '${ctx}/product/findProduct.do',
                type: 'POST',
                data: {
                    id:id
                },
                dataType: 'json',
                success: function (res) {
                    if (res.code === 200) {
                        $modal.modal();
                        $form.fill(res.data);
                        var $preDiv=$("#img-file-list");
                        $preDiv.empty();
                        if(res.data.pic){
                            $preDiv.append('<img class="am-radius" width="240" height="120" style="margin: 20px;" src="'+res.data.pic+'"/>');
                            $preDiv.append('<a href="javascript: void(0)" onclick="deleteSelectedImg()" class="am-close am-close-spin" style="position: absolute;top: 50px;right: 15px;">&times;</a>');
                        }
                        $("#company_select").attr('value',res.data.companyId);
                        initModalSelect();
                        $("#category_select").attr('value',res.data.categoryId);
                        $("#attribute_select").attr('value',res.data.attributeId);
                    }
                }
            });
        }

        //下架
        function deleteProduct(id){
            var $model=$('#delete-confirm');
            $model.modal({
                relatedTarget: this,
                onConfirm: function() {
                    $.ajax({
                        url: '${ctx}/product/deleteProduct.do',
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