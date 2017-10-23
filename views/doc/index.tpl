<div class="hbox stretch">
    <aside class="aside aside-md">
        <div class="vbox">
            <section class="scrollable">
                <div class="wrapper" style="margin-top: 40px">
                    <ul class="nav nav-pills nav-stacked no-radius">
                        <li class="padder text-sm l-h-2x">属性</li>
                        {foreach $props as $task}
                            <li><a href="javascript:;" onclick="doc_gotodoc(this,'p-')">{$task}</a></li>
                        {/foreach}
                    </ul>
                    <ul class="nav nav-pills nav-stacked no-radius">
                        <li class="padder text-sm l-h-2x">方法</li>
                        {foreach $methods as $task}
                            <li><a href="javascript:;" onclick="doc_gotodoc(this,'')">{$task}</a></li>
                        {/foreach}
                    </ul>
                </div>
            </section>
        </div>
    </aside>
    <aside>
        <div class="vbox">
            <section class="scrollable">
                <div class="" id="dashboard-doc">
                    <div class="markdown-body">
                        {$doc}
                    </div>
                    <script type="text/javascript">
						requirejs(['highlight'], function () {
							$('#dashboard-doc .markdown-body pre code').each(function (i, code) {
								hljs.highlightBlock(code);
							});
						});
                    </script>
                </div>
            </section>
        </div>
    </aside>
    <script type="text/javascript">
		$('#dashboard-doc').find('a.doc-item').each(function (i, e) {
			var a = $(e);
			a.data('oftop', a.offset().top);
		});

		function doc_gotodoc(item, p) {
			var txt = '#doc-item-' + p + $(item).text().trim();
			$('#dashboard-doc').parent().scrollTop($(txt).data('oftop') - 60);
		}
    </script>
</div>