{if $sEvent=='add'}
	{include file='header.tpl' menu_content='create'}
{else}
	{include file='header.tpl'}
	<div class="page-header">
		<h1>{$aLang.topic_link_edit}</h1>
	</div>
{/if}

{include file='editor.tpl'}

{hook run='add_topic_link_begin'}


<form action="" method="POST" enctype="multipart/form-data" id="form-topic-add" class="wrapper-content">
	{hook run='form_add_topic_link_begin'}

	<input type="hidden" name="security_key" value="{$ALTO_SECURITY_KEY}" />

	<div class="form-group">
		<label for="blog_id">{$aLang.topic_create_blog}</label>
		<select name="blog_id" id="blog_id" onChange="ls.blog.loadInfo(jQuery(this).val());" class="form-control">
			<option value="0">{$aLang.topic_create_blog_personal}</option>
			{foreach $aBlogsAllow as $oBlog}
				<option value="{$oBlog->getId()}" {if $_aRequest.blog_id==$oBlog->getId()}selected{/if}>{$oBlog->getTitle()|escape:'html'}</option>
			{/foreach}
		</select>
		<p class="help-block"><small>{$aLang.topic_create_blog_notice}</small></p>
	</div>

	
	<script type="text/javascript">
		jQuery(document).ready(function($){
			ls.blog.loadInfo($('#blog_id').val());
		});
    </script>
	
	
	<div class="form-group">
		<label for="topic_title">{$aLang.topic_create_title}</label>
		<input type="text" id="topic_title" name="topic_title" value="{$_aRequest.topic_title}" class="form-control" />
		<p class="help-block"><small>{$aLang.topic_create_title_notice}</small></p>
	</div>

	<div class="form-group">
		<label for="topic_link_url">{$aLang.topic_link_create_url}</label>
		<input type="text" id="topic_link_url" name="topic_link_url" value="{$_aRequest.topic_link_url}" class="form-control" />
		<p class="help-block"><small>{$aLang.topic_link_create_url_notice}</small></p>
	</div>

	<div class="form-group">
		<label for="topic_text">{$aLang.topic_link_create_text}</label>
		<textarea name="topic_text" id="topic_text" rows="10" class="input-block-level mce-editor markitup-editor form-control">{$_aRequest.topic_text}</textarea>
	</div>

	<div class="form-group">
		<label for="topic_tags">{$aLang.topic_create_tags}</label>
		<input type="text" id="topic_tags" name="topic_tags" value="{$_aRequest.topic_tags}" class="form-control autocomplete-tags-sep" />
		<p class="help-block"><small>{$aLang.topic_create_tags_notice}</small></p>
	</div>

	<div class="checkbox">
		<label for="topic_forbid_comment">
			<input type="checkbox" id="topic_forbid_comment" name="topic_forbid_comment" value="1" {if $_aRequest.topic_forbid_comment==1}checked{/if} />
			{$aLang.topic_create_forbid_comment}
		</label>
		<p class="help-block"><small>{$aLang.topic_create_forbid_comment_notice}</small></p>
	</div>
	
	{if E::IsAdmin()}
		<div class="checkbox">
			<label for="topic_publish_index">
				<input type="checkbox" id="topic_publish_index" name="topic_publish_index" value="1" {if $_aRequest.topic_publish_index==1}checked{/if} />
				{$aLang.topic_create_publish_index}
			</label>
			<p class="help-block"><small>{$aLang.topic_create_publish_index_notice}</small></p>
		</div>
	{/if}

	<input type="hidden" name="topic_type" value="link" />
	
	{hook run='form_add_topic_link_end'}
	<br />
	
	<button type="submit" name="submit_topic_publish" id="submit_topic_publish" class="btn btn-success pull-right">{$aLang.topic_create_submit_publish}</button>
	<button type="submit" name="submit_preview" onclick="jQuery('#text_preview').parent().show(); ls.topic.preview('form-topic-add','text_preview'); return false;" class="btn btn-default">{$aLang.topic_create_submit_preview}</button>
	<button type="submit" name="submit_topic_save" id="submit_topic_save" class="btn btn-default">{$aLang.topic_create_submit_save}</button>
</form>

<div class="topic-preview" id="text_preview"></div>

{hook run='add_topic_link_end'}


{/block}
