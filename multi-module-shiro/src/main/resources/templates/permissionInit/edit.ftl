<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>編輯</title>
<link href="${basePath}/static/css/content-base.css"
	rel="stylesheet" />
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>编辑初始权限信息</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form action="${basePath}/permissionInit/edit" class="form-horizontal" method="post">
					<input hidden="true" id="id" name="id" type="text"
						value="<#if permissionInit??>${(permissionInit.id)!""}</#if>" />
					<div class="form-group">
						<label class="col-sm-3 control-label"><label
							for="LoginName">url地址</label>：</label>
						<div class="col-sm-8">
							<input class="form-control" id="url" name="url"
								placeholder="url地址" type="text" value="<#if permissionInit??>${(permissionInit.url)!""}</#if>"
								data-val="true" data-val-maxlength="url地址长度不能超过50个字符"
								data-val-maxlength-max="50" data-val-required="url地址不能为空" /> <span
								data-valmsg-for="url" data-valmsg-replace="true"
								class="field-validation-valid"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><label
							for="RealName">url权限</label>：</label>
						<div class="col-sm-8">
							<input class="form-control" id="permissionInit" name="permissionInit"
								placeholder="url权限" type="text" value="<#if permissionInit??>${(permissionInit.permissionInit)!""}</#if>"
								data-val="true" data-val-maxlength="url权限长度不能超过20个字符"
								data-val-maxlength-max="20" data-val-required="url权限不能为空" /> <span
								data-valmsg-for="permissionInit" data-valmsg-replace="true"
								class="field-validation-valid"></span>
						</div>
					</div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><label
                                for="RealName">sort顺序</label>：</label>
                        <div class="col-sm-8">
                            <input class="form-control" id="sort" name="sort"
                                   placeholder="url权限" type="number" value="<#if permissionInit??>${(permissionInit.sort)!""}</#if>"
                                   data-val="true" data-val-maxlength="sort数值长度不能超过99"
                                   data-val-maxlength-max="2" data-val-required="sort顺序不能为空" /> <span
                                data-valmsg-for="sort" data-valmsg-replace="true"
                                class="field-validation-valid"></span>
                        </div>
                    </div>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-8">
							<button class="btn btn-info" type="submit" id="btnSave">保存</button>
							<button class="btn btn-white" type="button" id="back"
								data-type="url">返回</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${basePath}/static/js/content/base.js"></script>
	<script src="${basePath}/static/js/content/action.js"></script>
	<script src="${basePath}/static/js/content/jqueryValidator.js"></script>
	<script type="text/javascript">
	$("#back").bind("click", function() {
		window.location.href="/permissionInit/permissionInitPage";
	});
	</script>
</body>
</html>

