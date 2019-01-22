<form id="qForm" class="form-horizontal" method="post" action="update">
    <div class="box-body">
        <div class="col-md-6">
            <div class="form-group">
                <label class="col-lg-2 control-label">存储方式</label>
                <div class="col-lg-10">
                    <select class="form-control" name="store_scheme" data-select="${configs['store_scheme'].value}">
                        <option value="native">本地存储</option>
                        <option value="upyun">又拍云</option>
                    </select>
                </div>
            </div>
            <div class="scheme" data-scheme="upyun">
                <div class="form-group">
                    <label class="col-lg-2 control-label">空间名称</label>
                    <div class="col-lg-10">
                        <input type="text" name="upyun_oss_bucket" class="form-control" value="${configs['upyun_oss_bucket'].value}" placeholder="又拍云bucket名称">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">操作员名称</label>
                    <div class="col-lg-10">
                        <input type="text" name="upyun_oss_operator" class="form-control" value="${configs['upyun_oss_operator'].value}" placeholder="又拍云operator">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">操作员密码</label>
                    <div class="col-lg-10">
                        <input type="text" name="upyun_oss_password" class="form-control" value="${configs['upyun_oss_password'].value}" placeholder="又拍云operator password">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">域名绑定</label>
                    <div class="col-lg-10">
                        <input type="text" name="upyun_oss_domain" class="form-control" value="${configs['upyun_oss_domain'].value}" placeholder="示例: http://mtons.b0.upaiyun.com">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">文件目录</label>
                    <div class="col-lg-10">
                        <input type="text" name="upyun_oss_src" class="form-control" value="${configs['upyun_oss_src'].value}" placeholder="示例: /static/">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="box-footer">
        <button type="submit" class="btn btn-primary">提交</button>
    </div>
</form>
<script>
    $(function () {
        $('select[name=store_scheme]').change(function () {
            var value = $(this).val();
            $('.scheme').each(function () {
                if ($(this).data('scheme') === value) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }).trigger('change');
    });
</script>