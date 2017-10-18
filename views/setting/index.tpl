{if $groups}
    <div class="bg-light">
        <div class="wrapper-lg p-b-xs p-t-xs"></div>
        <ul class="nav nav-tabs p-t-n-xs">
            {foreach $groups as $gp=>$g}
                <li class="{if $g@index == 0}m-l-lg{/if} {if $gp == $group}active{/if}">
                    <a href="{$cfgurl}/{$gp}" id="navi-system-setting">{$g}</a>
                </li>
            {/foreach}
        </ul>
    </div>
{else}
    <div class="bg-light">
        <div class="wrapper-lg p-b-xs p-t-xs"></div>
        <ul class="nav nav-tabs p-t-n-xs">
            <li class="m-l-lg active">
                <a href="javascript:void();">{$settingName}</a>
            </li>
        </ul>
    </div>
{/if}
<div class="wrapper" style="max-width: 700px">
    <form name="SettingForm" action="{'~setting/save'|app}/{$setting}/{$group}" data-validate="{$rules|escape}"
          data-ajax method="post" role="form" class="form-horizontal">
        {$form|render}
        <div class="form-group">
            <div class="col-md-offset-3 col-md-9 col-xs-12">
                <button type="submit" class="btn btn-primary">保存</button>
                <button type="reset" class="btn btn-default">重置</button>
            </div>
        </div>
    </form>
</div>