<div class="console-container" id="vue-page">

    <div class="console-title">
        <div class="pull-left">
            <h5>
                tables 表格分页 </h5>
        </div>
        <div class="pull-right">
            <button type="button" class="btn btn-default "></button>
        </div>
    </div>
    <div class="console-tabs">
        <ul class="nav nav-tabs nav-tabs-component nav-tabs-highlight">
            <li class="active"><a href="#tab1" data-toggle="tab" aria-expanded="false">tab1</a></li>
            <li class=""><a href="#tab2" data-toggle="tab" aria-expanded="true">tab2</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="#tab3" data-toggle="tab">菜单3</a></li>
                    <li><a href="#tab4" data-toggle="tab">菜单4</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="console-search">
        <form action="" method="post" class="form-inline" role="form" @submit.prevent="handFormSubmit">
            <div class="form-group">
                <label for="status" class="sr-only">select label</label>
                <select name="status" class="form-control" v-model="form.status">
                    <option value="11">选择11</option>
                    <option value="22">选择22</option>
                </select>
            </div>

            <div class="form-group">
                <label class="sr-only" for="">input label</label>
                <input type="text" class="form-control" name="" placeholder="输入关键字" v-model="form.keyword">
            </div>

            <!-- element ui 写法 记得 v-model="" 具体用法请见 http://element.eleme.io/ -->
            <div class="form-group">
                <label class="sr-only" for="">input label</label>
                <el-date-picker v-model="form.date" type="daterange" placeholder="选择日期范围"></el-date-picker>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="button" class="btn btn-primary" data-toggle="right-sidebar">高级搜索</button>

        </form>
    </div>

    <div class="console-table">
        <table class="table table-hover table-nowrap">
            <thead>
            <tr>
                <th width="10">#</th>
                <th wula-sort="username" wula-sort-default="desc">帐号</th>
                <th wula-sort="mobile">手机</th>
                <th wula-sort="status_id">状态</th>
                <th>分组</th>
                <th wula-sort="created_at">注册时间</th>
                <th wula-sort="updated_at">更新时间</th>
                <th>
                    <button class="btn btn-default btn-xs"><i class="fa fa-filter"></i></button>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="item in items">
                <td><input type="checkbox" :value="item.id" v-model="ids"></td>
                <td>{{item.username}}</td>
                <td>{{item.mobile}}</td>
                <td>{{item.status_id}}</td>
                <td>{{item.group_id}}</td>
                <td>{{item.created_at}}</td>
                <td>{{item.updated_at}}</td>
                <td><a href="#ff" class="btn btn-default btn-xs">删除</a></td>
            </tr>

            </tbody>
        </table>
    </div>

    <div class="console-pagination">
        <table class="table  border-bottom">
            <tfoot>
            <tr>
                <td width="10"><input type="checkbox" @click="selectAll"></td>
                <td colspan="4">
                    <div class="pull-left">
                        <button class="btn btn-default">批量删除</button>
                    </div>
                    <div class="pull-right">
                        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                                       :current-page="page.page" :page-sizes="[20, 50, 100, 150]" :page-size="page.size"
                                       layout="sizes, prev, pager, next" :total="page.total"></el-pagination>
                    </div>
                </td>
            </tr>
            </tfoot>
        </table>
    </div>

    <div class="console-right-sidebar">
        <div class="right-sidebar ">
            <div class="right-sidebar-body">
                <h3>高级搜索</h3>
                <div class="right-sidebar-form">
                    <form action="" method="post" role="form" class="form-horizontal mb-15"
                          @submit.prevent="handFormSubmit">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Name:</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" placeholder="输入名称" v-model="form.keyword">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Name:</label>
                            <div class="col-lg-9">
                                <el-date-picker v-model="form.date" type="date" value="2016-12-2"
                                                placeholder="选择日期"></el-date-picker>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Name:</label>
                            <div class="col-lg-9">
                                <select name="status" class="form-control" v-model="form.status">
                                    <option value="11">选择11</option>
                                    <option value="22">选择22</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                    <form action="" method="post" role="form" @submit.prevent="handFormSubmit">
                        <div class="form-group">
                            <label for="">Name:</label>
                            <input type="text" class="form-control" placeholder="Input..." v-model="form.keyword">
                        </div>
                        <div class="form-group">
                            <label for="">带快捷选项:</label>
                            <el-date-picker v-model="form.date" type="daterange" align="right"
                                            placeholder="选择日期范围"></el-date-picker>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>

            <div class="right-sidebar-close">
                <div class="right-sidebar-close-inner">
                    <div class="right-sidebar-close-icon fa"></div>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
	/**
	 * table初始化
	 * @param el vue挂载的对象
	 * @param url ajax加载地址
	 * @param data @{form:搜索表单字段, table:分页相关变量}
	 *
	 */
	var form = $.wula.table(
		'#vue-page',
		'{"~users"|app}', {
			form: {
				date   : '',
				keyword: '',
				status : ''
			}
		});
</script>