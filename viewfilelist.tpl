<h1>{$title}</h1>
<h2>For
	<a href="{$smarty.const.WWW_TOP}/details/{$rel.guid}">{$rel.searchname|escape:'htmlall'}</a>
</h2>
<table class="data table table-striped table-responsive sortable table-condensed table-hover">
	<tr>
		<th>#</th>
		<th>filename</th>
		<th></th>
		<th style="text-align:center;">completion</th>
		<th style="text-align:center;">size</th>
	</tr>
	{foreach $files as $i=>$file name="iteration"}
		<tr class="{cycle values=",alt"}">
			<td width="20">{$smarty.foreach.iteration.index+1}</td>
			<td>{$file.title|escape:'htmlall'}</td>
			{assign var="icon" value='assets/images/fileicons/'|cat:$file.ext|cat:".png"}
			{if $file.ext == "" || !is_file("$icon")}
				{assign var="icon" value='file'}
			{else}
				{assign var="icon" value=$file.ext}
			{/if}
			{if $file.partstotal != 0}
				{assign var="completion" value=($file.partsactual/$file.partstotal*100)|number_format:1}
			{else}
				{assign var="completion" value=0|number_format:1}
			{/if}
			<td><img title=".{$file.ext}" alt="{$file.ext}"
					 src="{$smarty.const.WWW_ASSETS}/images/fileicons/{$icon}.png"/></td>
			<td class="less right">{if $completion < 100}<span class="warning">{$completion}
					%</span>{else}{$completion}%{/if}</td>
			<td class="less right">{$file.size|filesize}</td>
		</tr>
	{/foreach}
</table>
