<script src="includes/js/jquery/ui.js"></script>
<script src="includes/js/jquery/plugins/jquery.plugin.js"> </script>
<script src="includes/js/jquery/plugins/jquery.window.js"> </script>
<script src="includes/js/jquery/plugins/jquery.window-extensions.js"> </script>
<script src="includes/js/imodal/imodal.js"></script>


<style type="text/css">
            #blockListId { list-style-type: none; margin: 0; padding: 0; width: 60%;}
            #blockListId li { margin: 0px; padding: 0px; height: 2em;}
            html>body #blockListId li { height: 2em; line-height: 2em;}
            .ui-state-highlight {
                height: 2em;
                line-height: 2em;
                background-color:#FFF1A8;
            }
 </style>
<form name="frmDynamicContentTagsEdit" id="frmDynamicContentTagsEdit" method="post" action="{$AdminUrl}&Action=Save">
	<input type="hidden" id="id_dynamiccontenttags_id" name="dynamiccontenttags_id" value="{$DynamicContentTagId}" />
	<table cellspacing="0" cellpadding="0" width="100%" align="center">
		<tr>
			<td class="Heading1 col-sm-4 Heading1New">
				{if $FormType == 'create'}
					{$lang.Addon_dynamiccontenttags_Form_CreateHeading}
				{elseif $FormType == 'edit'}
					{$lang.Addon_dynamiccontenttags_Form_EditHeading}
				{/if}
			</td>
		</tr>
		<tr>
			<td class="body pageinfo">
				<p class="PageIntroP">
					{$lang.Addon_dynamiccontenttags_Form_Intro}
				</p>
			</td>
		</tr>
		<tr>
			<td id="FlashMessages">
				{$FlashMessages}
			</td>
		</tr>
		<tr>
			<td>
				<table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style="margin-top:10px ; border-bottom:0px">
					<tr>
						<td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
							{$lang.Addon_dynamiccontenttags_Form_General_Settings}
						</td>
					</tr>
					<tr style="height:15px"></tr>
					<tr>
						<td width="20%" class="Field FieldWidthFix">
							{template="required"}
							{$lang.Addon_dynamiccontenttags_Name}:&nbsp;
						</td>
						<td >
							<input type="text" id="id_dynamiccontenttags_name" name="dynamiccontenttags_name" class="Field250 form_text form-control inputTextFix" value="{$dynamiccontenttags_name}" style="width:446px;margin-right:0px;" />
							{$lnghlp.Addon_dynamiccontenttags_Name}<br />
                            <span style="font-style:italic;">{$lang.Addon_dynamiccontenttags_NameEg}</span><br /><br />
						</td>
					</tr>
					<tr>
						<td width="20%" class="Field FieldWidthFix">
							{template="required"}
							{$lang.Addon_dynamiccontenttags_Email_List}?&nbsp;
						</td>
						<td>
							<select id="SelectList" name="SelectList[]" multiple="multiple" class="ISSelectReplacement ISSelectSearch ISSelectDiv form-control" style="{$SelectListStyle}">
								{$SelectListHTML}
							</select>
							&nbsp;{$lnghlp.Addon_dynamiccontenttags_Email_List}
						</td>
					</tr>
					<tr>
						<td class="FieldLabel">&nbsp;
						</td>
						<td >
						<span style="font-style:italic;">{$lang.Addon_dynamiccontenttags_Subscriber_List_Tips}</span>
						</td>
					</tr>
				</table>

				<table border="0" cellspacing="0" cellpadding="4" class="Panel">
					<tr>
						<td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
							&nbsp;&nbsp;{$lang.Addon_dynamiccontenttags_Form_Block_Settings}
						</td>
					</tr>
					<tr height="15px"></tr>
					<tr>
                            <td class="Field FieldWidthFix" width="20%" style="vertical-align:top;">
							{template="required"}
							{$lang.Addon_dynamiccontenttags_Block}:&nbsp;
						</td>
						<td >
							<div id="blockContainers">
							<!--block container-->

							</div>
							<div class="flexibleWidth" style="float:left;clear:both;">
								<input class="FormButton btn saveNew-btn save-btn buttonWidth" type="button" name="New_Block" id="Id_New_Block" value="{$lang.Addon_dynamiccontenttags_AddContentBlock}" style="width:167px" />
								<input class="FormButton btn save-btn saveNew-btn buttonWidth" type="button" name="Delete_Blocks" id="Id_Delete_Blocks" value="{$lang.Addon_dynamiccontenttags_DeleteSelected}" style="width:167px" />
								{$lnghlp.Addon_dynamiccontenttags_Block}
							</div>

						</td>
					</tr>
					<tr height="30px"></tr>
					<tr>
					<td>&nbsp;</td>
					<td class="threeButtonColumn">
					<input class="FormButton submitButton btn save-btn buttonsFix" type="button" name="Submit_Edit" value="{$lang.Addon_dynamiccontenttags_SaveEdit}" style="width:167px" />
				<input class="FormButton submitButton btn save-btn margintopFix buttonsFix" type="button" name="Submit_Exit" value="{$lang.Addon_dynamiccontenttags_SaveExit}" style="width:167px" />
				<input class="FormButton cancelButton btn cancel-btn margintopFix buttonsFix" type="button" value="{$lang.Addon_dynamiccontenttags_Cancel}" style="width:167px;" />
				<input type="hidden" id="subactid" name="subact" value="saveexit" />
				<br />&nbsp;
					</td>
					</tr>
				</table>

			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" >
var win;
function ShowBlockForm(blockId, tagId) {
	if (location.href.indexOf('?') != -1) {
		var url_part = location.href.split(/\?/);
		var url_to_indexphp = url_part[0];
	} else {
		var url_to_indexphp = location.href;
	}
	var title = '%%LNG_Addon_dynamiccontenttags_Block_Form_CreateHeading%%';
	var temp = url_to_indexphp + '?Page=Addons&Addon=dynamiccontenttags&Action=showblockform&id=' + blockId + '&tagId=' + tagId + '&ajax=1';
            win = $.fn.window.create({
		title:title,
		height:500,
		width:700,
		uri:temp
	});
	win.open();

}

$(document).ready(function() {
	$('#Id_New_Block').click(function() {
		if ($('#SelectList > ul > li > label > input:checked').size() < 1) {
			alert ('{$lang.Addon_dynamiccontenttagsOperator_FormAlertSpecifyBlockList}');
			return;
		}
        var randomBlockId = $('#id_dynamiccontenttags_id').val();
		ShowBlockForm(0, randomBlockId);
	});

	$('#Id_Delete_Blocks').click(function() {
		if($('.blocksid_class:checked').size() < 1) {
			alert ('{$lang.Addon_dynamiccontenttags_Delete_SelectBlocks}');
			return;
		}
		// remove the blocks
		if (confirm('{$lang.Addon_dynamiccontentblocks_Delete_ConfirmMessage}')) {
			var selectedDeleteBlocks = new Array;
			$('.blocksid_class:checked').each(function() {
				selectedDeleteBlocks.push($(this).val());
			})
			BlockInterface.DeleteBlock(selectedDeleteBlocks);
		}
	});
	$('#SelectList > ul > li').click(function() {
		if (!$(this).hasClass('SelectedRow')) {
			var otherSelectedList = [];
			$('#SelectList > ul > .SelectedRow > label > input').each(function() {
				otherSelectedList.push($(this).val());
			});
			BlockInterface.CleanListBlock($(this).children().val(), otherSelectedList);
		}
	});
	$('.cancelButton').click(function() {
		if (confirm('{$lang.Addon_dynamiccontenttagsOperator_FormAlertCancel}')) {
			window.location.href = "{$AdminUrl}";
		}

	});
	$('.submitButton').click(function() {
		if ($('#id_dynamiccontenttags_name').val() == '') {
			alert ('{$lang.Addon_dynamiccontenttagsOperator_FormAlertSpecifyTagName}');
			$('#id_dynamiccontenttags_name').focus();
			return;
		}

		if ($('#SelectList > ul > li > label > input:checked').size() < 1) {
			alert ('{$lang.Addon_dynamiccontenttagsOperator_FormAlertSpecifyTagList}');
			return;
		}

		if ($('.blocks_class').size() < 1) {
			alert ('{$lang.Addon_dynamiccontenttagsOperator_FormAlertSpecifyBlock}');
			return;
		}

		if ($('.class_defaultset').size() > 0) {
                    var defaultSet = false;
                    $('.class_defaultset').each(function(){
                        if ($(this).text() != '') {
                            defaultSet = true;
                        }
                    });
                    if (!defaultSet) {
                        alert ('{$lang.Addon_dynamiccontenttagsOperator_FormAlertSpecifyDefaultBlockFirst}');
                        return;
                    }
		}

		$('#subactid').val('saveexit');
		if ($(this).attr('name') == 'Submit_Edit') {
			$('#subactid').val('saveedit');
		}

		$.post(	'index.php?Page=Addons&Addon=dynamiccontenttags&Action=checkduplicatetag&ajax=1',
		{'tagid': $('#id_dynamiccontenttags_id').val(), 'tagname': $('#id_dynamiccontenttags_name').val()},
		function(response) {
                    if (response != '') {
                        alert (response);
                        $('#id_dynamiccontenttags_name').focus();
                        return;
                    } else {
                        document.frmDynamicContentTagsEdit.submit();
                    }
		});
		return;
	});
        BlockInterface.TriggerDeleteButton();

	{$dynamiccontenttags_blocks}

        $(function() {
		$("#blockListId").sortable({
                    opacity: 0.6,
                    cursor:'crosshair',
                    placeholder: 'ui-state-highlight',
                    update: function() {
			var order = $(this).sortable("serialize");
			$.post("index.php?Page=Addons&Addon=dynamiccontenttags&Action=updateblocksorder&ajax=1", order,
                        function(response){
			});
                    }
		});
        });

});

var BlockInterface = {
	GetTotalBlock: function () {
		var TotalBlock = $('#blockListId').children().length;
		return TotalBlock;
	},
	Add: function(id, name, activated, sortorder, encodedRules) {
		nameDisplay = name.slice(0,70);
		if (name.length > 70) {
			nameDisplay = nameDisplay + ' ...';
		}
		var blockHtml =
		  ' <li title="' + name + '" class="blocks_class heightAdjustable ui-state-default" id="blockid_'+id+'" onmouseover="$(this).addClass(\'ISSelectOptionHover\');" onmouseout="$(this).removeClass(\'ISSelectOptionHover\');" style="clear:both;">'
		+ ' <label class="customCheckBox labelCheckbox" style="float:left;width:450px;" for="id_number" style="cursor:pointer;" onclick="if($(this).parent().hasClass(\'SelectedRow\')) {  $(this).parent().removeClass(\'SelectedRow\'); $(this).children().attr(\'checked\', false); } else { $(this).parent().addClass(\'SelectedRow\'); $(this).children().attr(\'checked\',true); }">'
                + ' <input id=\'blockid_'+id+'\' class="blocksid_class" name="blockids" value="'+id+'" type="checkbox" style="vertical-align:top;" />'+nameDisplay+'&nbsp;<span class="class_defaultset" id="id_defaultset_'+id+'" for="defaultset"></span><span class="checkmark"></span></label>'
		+ ' '
		+ ' <span class="imageSpanFix" style="float: right;width: 15%;text-align: end;margin-top: 5px;margin-bottom: 5px;margin-right: 5px;">'
		+ ' <label title="Edit" style="margin-right:2px;" for="id_edit">'
		+ ' <a href="#" onclick="ShowBlockForm(\''+id+'\','+$('#id_dynamiccontenttags_id').val()+');"><img style="border:0;" src="images/edit.svg" /></a>'
		+ ' </label>'
		+ ' <label title="Delete" style="margin-right:2px;" id="blockid_'+id+'_deletelbl" for="block_delete">'
		+ ' <a href="#" onclick="if(!confirm(\'{$lang.Addon_dynamiccontentblocks_Delete_ConfirmMessage}\')) {return;} BlockInterface.DeleteBlock('+id+')"><img style="border:0;" src="images/delete.svg" /></a>'
		+ ' </label>'
		+ ' </span>'
		+ ' <input class="blocks_name_class" id="blockid_'+id+'_name" type="hidden" name="blocks['+id+'][name]" value="'+name+'" />'
		+ ' <input id="blockid_'+id+'_data" class="blocks_data_class" name="blocks['+id+'][data]" value=\''+encodedRules+'\' type="hidden"/>'
		+ ' <input class="blockidhidden_class" name="blockids[]" value="'+id+'" type="hidden"/>'
		+ ' <input id=\'blockid_'+id+'_activated\' class="blockid_class" name="blocks['+id+'][activated]" value="'+activated+'" type="hidden"/>'
		+ ' <input id=\'blockid_'+id+'_sortorder\' class="blocksortorder_class" name="blocks['+id+'][sortorder]" value="'+sortorder+'" type="hidden"/>'
		+ ' </li>'
		;

		if(this.GetTotalBlock() <= 0) {
			blockHtml = '<ul class="ISSelect bottomISSelect form-control" style="width:465px;height:150px;clear:both;float:left;" id="blockListId">'+blockHtml+'</ul>'
			$('#blockContainers').html(blockHtml);
		} else {
			if ($('#blockid_'+id).length) {
				$('#blockid_'+id).replaceWith(blockHtml);
			} else {
				$('#blockListId').append(blockHtml);
			}
		}


		if (activated == 1) {
			this.SetActivate(id);
		}
                this.TriggerDeleteButton();
	},
	SetActivate: function(id) {
		$('.class_defaultset').text('');
		$('#id_defaultset_'+id).text('{$lang.Addon_dynamiccontenttags_Block_DefaultString}');
		$('.blockid_class').val(0);
		$('#blockid_'+id+'_activated').val(1);
	},
	CleanListBlock: function(id, list) {
		$.post(	'index.php?Page=Addons&Addon=dynamiccontenttags&Action=customfieldcomparebylist&ajax=1',
		{	'ajaxType': 'CustomFieldCompareByList',
		'listid[]': id, 'otherlistid[]': list},
		function(response) {
			var message = '';
			var results = eval('('+response+')');
			var blockIds = new Array();
			if(results) {
				listCustomFields = new Array();
				for(var i=0; i<results.length; i++) {
					listCustomFields.push(results[i]);
				}

				if ($('.blocks_data_class').length > 0) {
					$('.blocks_data_class').each(function() {
						var ExistingBlockRules = $.evalJSON($(this).val()).Rules;
						var ExistingBlockName = $.evalJSON($(this).val()).BlockName;
						var ExistingBlockId = $(this).next().val();
						var CatchedBlock = false;
						for(var k = 0; k < ExistingBlockRules[0].rules.length; k++) {
							for(var i=0; i<listCustomFields.length; i++) {
								if (listCustomFields[i] == ExistingBlockRules[0].rules[k].rules.ruleName ) {
									CatchedBlock = true;
								}
							}
						}
						if (CatchedBlock) {
							message += "\n - " + ExistingBlockName;
							blockIds.push(ExistingBlockId);
						}
					});
				}



			}
			if (message != '') {
				if (confirm("{$lang.Addon_dynamiccontenttags_ListAffectBlocks}: " + message)) {
					BlockInterface.DeleteBlock(blockIds);
					return;
				}
				$('#ISSelectSelectList_'+id).children().click();
				return;
			}
		});
	},
        TriggerDeleteButton: function() {
            if ($('.blocks_class').size() < 1) {
                $('#Id_Delete_Blocks').attr('disabled', 'disabled');
            } else {
                $('#Id_Delete_Blocks').removeAttr('disabled');
            }
        },
	DeleteBlock: function(id) {
                // checking if it's ok to delete the blocks
                var blockArray = [id];
                if (isArray(id)) {
                    blockArray = id;
                }
                if ($('.blocks_class').size() == blockArray.length) {
                    alert ('{$lang.Addon_dynamiccontenttags_FormAlertMinimumBlock}');
                    return;
                }

                // Check if the default block is selected
                var defaultBlockSelected = false;
                for (var i=0; i<blockArray.length; i++) {
                    if( $('#id_defaultset_' + eval(blockArray[i])).text()  != '' ) {
                        defaultBlockSelected = true;
                    }
                }

		$.post(	'index.php?Page=Addons&Addon=dynamiccontenttags&Action=deleteblock&ajax=1',
		{'ajaxType': 'DeleteBlock',
		'blockid[]': id},
		function(response) {
			if (response.result > 0) {
                                for (var i=0; i<blockArray.length; i++) {
                                        $('#blockid_' + blockArray[i]).remove();
                                }
                                // Set the highest priority's block to default block.
                                if (defaultBlockSelected) {
                                    // Update the block list interface
                                    var defaultBlockId = $('#blockListId li:first-child').children('.blockidhidden_class').val();
                                    $('#id_defaultset_' + defaultBlockId).text('{$lang.Addon_dynamiccontenttags_Block_DefaultString}');
                                    $('#blockid_' + defaultBlockId + '_activated').val('1');
                                    // Update the default set in database
                                    $.post("index.php?Page=Addons&Addon=dynamiccontenttags&Action=setdefaultblock&ajax=1",
                                    {'ajaxType': 'SetDefaultBlock',
                                    'blockId':defaultBlockId},
                                    function(response){
                                    });

                                }
			}
			$('#FlashMessages').html(response.message);
                        BlockInterface.TriggerDeleteButton();
		}, "json");
	}
}
</script>

<style>
.FormButton.btn.saveNew-btn.save-btn.buttonWidth {
    white-space: nowrap;
}
.heightAdjustable{
	display:table !important;
	width:inherit !important;
}
.ISSelectSearch{
	display: block;
    height: calc(1.5em + 0.75rem + 2px);
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.labelCheckbox{
	float: left !important;
    width: 80% !important;
    word-break: break-word !important;
}
.bottomISSelect li .customCheckBox {
    padding-bottom: 0px;
    padding-top: 0px;
    margin: 5px 0px 5px 10px;
    vertical-align: middle;
}
.content{		
	background-color: #ffffff;
}
.inputTextFix{
	display:inline !important;
}
.ISSelectDiv{
	height:150px !important;
	width:450px;
}
.Field250 {
    margin-top: 0px;
}
.RuleRowRuleName,.RuleRowRuleOperator,.TextInputType{
	display:inline;
}
.topMarginBtn{
	margin-top:8px;
}
.title{
	background-color:#EBF5FA!important;
}
.helpTip {
	font-weight:600 !important;
}
.HelpToolTip img:first-child{
	vertical-align:top;
}
.toolTipFix span div.HelpToolTip_Placeholder{
	top:251px;
}
.ui-window{
	top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: : translate(-50%, -50%);
	-webkit: translate(-50%, -50%);
	-moz-transform: : translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	-webkit-transform: -webkit-translate(-50%, -50%);
}
.ui-window .content, #ModalContent, .ModalContent {
	margin-right: 5px !important;
}
.saveNew-btn {
    background-color: #0d5085;
    color: #ffffff;
    border-color: transparent;
    font-size: 13px !important;
    box-shadow: 0 2px 1px rgb(0 0 0 / 16%), 0 0px 0px rgb(0 0 0 / 12%);
	background: #ebeef1;
    color: black;
}
.saveNew-btn:hover {
    background-color: #0d5085;
    color: #ffffff;
    border-color: transparent;
    font-size: 13px !important;
    box-shadow: 0 2px 1px rgb(0 0 0 / 16%), 0 0px 0px rgb(0 0 0 / 12%);
	background: #ebeef1;
    color: black;
}

.FieldWidthFix{
	padding-right: 10px;
}
.ISSelectDiv, .ISSelectSearch,.ISSelect{
		width:450px;
}
.flexibleWidth {
	margin-top:0px;
}
.FormButton {
    margin-top: 0px !important;
}
@media screen and (max-width:1024px){
	.BodyContainer{
		width:97%!important;
	}
	.FieldWidthFix{
		width:25%;
	}
	.BodyContainer{
		width:98%!important;
	}
	.inputTextFix,.ISSelectDiv,.ISSelectSearch, .ISSelect{
		width:450px!important;
	}
	.ui-window{
		//top: 260.5px !important;
		//left: 150.5px !important;
	}
}
@media screen and (max-width:768px){
	.BodyContainer{
		width:97%!important;
	}
	.threeButtonColumn{
		display:flex;
		flex-direction:column;
	}
	.margintopFix{
		margin-top:6px;
	}
	.ISSelectSearch,.inputTextFix,.ISSelect {
		width:402px!important;    margin-right: 15px;
	}
	.buttonWidth{
		width:198px!important;
	}
	.FieldWidthFix{
		width:40%;
	}
	.HelpToolTip img:first-child{
		margin-top:5px !important;    margin-bottom: 10px;
	}
	.ui-window{
		//left:25px !important;
		//top: 305.5px !important;
	}
}
@media screen and (max-width:540px){
	.labelCheckbox{
		width:68% !important;
	}
	.imageSpanFix{
		width:25% !important;
		margin-top:7px !important;
	}
	.BodyContainer{
		width:96%!important;
	}
	.buttonWidth,.buttonsFix{
		width:198px!important;
	}
	.flexibleWidth{
		display:flex;
		flex-direction:column;
	}
	#Id_Delete_Blocks{
		margin-top:6px;
	}
	.margintopFix{
		margin-top:6px;
	}
	.HelpToolTip img:first-child{
		margin-top:5px !important;
	}
	.inputTextFix,.ISSelectDiv,.ISSelectSearch,.ISSelect{
		width:279px!important;
	}
	.FieldWidthFix{
		width:38% !important;
	}
	.ui-window{
		width:500px !important;
		//left:6.5px !important;
		//top: 305.5px !important;
	}
	#ui-datepicker-div+.ui-window {
		width:500px !important;
		//left:6.5px !important;
		//top: 305.5px !important;
		box-shadow: 0 2px 10px rgb(0 0 0 / 20%);
	}
	.content{
		width:95% !important;
	}
	.RuleRowRuleName{
		width:124px !important;
	}
	.RuleRowRuleOperator {
		width:44px !important;
	}
	.TextInputType{
		width:124px !important;
	}
	.RuleRowAddButton{
		margin-left:-4px !important;
	}
	.PageIntroP{
		width:101%;
	}
	#id_dynamiccontenttags_block_name{
		width:100% !important;
	}
	.scrollableEditor{
		overflow-x:scroll !important;
		width:440px;
	
	}
	.flexColumn{
		display:flex;
		flex-direction:column;
	}
	.marginAdjustable{
		margin-top:18px;
	}
	.paddingAdjustTop{
		padding-top:14px!important;
	}
	.RuleRowRuleActions a img {
		padding-top: 9px;
    	vertical-align: bottom;
	}
	#id_dynamiccontenttags_block_name {
		margin-top:20px;
	}
}
@media screen and (max-width:414px){
	.labelCheckbox{
		width:64% !important;
	}
	.imageSpanFix{
		float:unset !important;
	}
	.BodyContainer{
		width:95%!important;
	}
	.FieldWidthFix{
		width:38% !important;
	}
	.inputTextFix,.ISSelectDiv,.ISSelectSearch,.ISSelect{
		width:216px!important; margin-right: 0px !important;
	}
	.buttonsFix{
		width:198px!important;
	}
	.ui-window{
		width:354px !important;
		//left:11.5px !important;
		//top: 374.5px !important;
	}
	#ui-datepicker-div+.ui-window {
		width:354px !important;
		//left:11.5px !important;
		//top: 374.5px !important;
		box-shadow: 0 2px 10px rgb(0 0 0 / 20%);
	}
	.content{
		width:92% !important;
	}
	.RuleRowRuleName{
		width:124px !important;
	}
	.RuleRowRuleOperator {
		width:44px !important;
	}
	.TextInputType{
		width:100px !important;
	}
	.RuleRowAddButton{
		margin-left:-4px !important;
	}
	.PageIntroP{
		width:100%;
	}
	.scrollableEditor{
		overflow-x:scroll !important;
		width:300px;
		margin-top:25px;
	}
	.flexColumn{
		display:flex;
		flex-direction:column;
	}
	.marginAdjustable{
		margin-top:18px;
	}
	.RuleRowRuleActions a img {
		padding-top: 9px;
    	vertical-align: bottom;
	}
	#id_dynamiccontenttags_block_name {
		margin-top:20px;
	}
}
@media screen and (max-width:411px){
	.FieldWidthFix{
		width: 38% !important;
    	vertical-align: top;
	}
	.inputTextFix,.ISSelectDiv,.ISSelectSearch,.ISSelect{
		width:202px!important; margin-right: 0px !important;
	}
	.ui-window{
		width:354px !important;
		//left:11.5px !important;
		//top: 374.5px !important;
	}
	#ui-datepicker-div+.ui-window {
		width:300px !important;
		//left: 43.5px !important;
		//top: 445.5px !important;
		box-shadow: 0 2px 10px rgb(0 0 0 / 20%);
	}
	.content{
		width:92% !important;
	}
	.RuleRowRuleName{
		width:124px !important;
	}
	.RuleRowRuleOperator {
		width:44px !important;
	}
	.TextInputType{
		width:100px !important;
	}
	.RuleRowAddButton{
		margin-left:-4px !important;
	}
	.PageIntroP{
		width:100%;
	}
	.scrollableEditor{
		overflow-x:scroll !important;
		width:300px;
		margin-top:25px;
	}
	.flexColumn{
		display:flex;
		flex-direction:column;
	}
	.marginAdjustable{
		margin-top:18px;
	}
	.RuleRowRuleActions a img {
		padding-top: 9px;
    	vertical-align: bottom;
	}
	#id_dynamiccontenttags_block_name {
		margin-top:20px;
	}
}
@media screen and (max-width:375px){
	.labelCheckbox{
		width:59% !important;
	}
	.BodyContainer{
		width:94%!important;
	}
	.FieldWidthFix{
		width: 36% !important;
    	vertical-align: top;
	}
	.inputTextFix,.ISSelectDiv,.ISSelectSearch,.ISSelect{
		width:190px!important; margin-right: 0px !important;
	}
	.HelpToolTip_Placeholder{
		margin:26px -98px !important;
	}
	.ui-window{
		width:327px !important;
		//left:6.5px !important;
		//top: 305.5px !important;
	}
	#ui-datepicker-div+.ui-window {
		width:327px !important;
		//left:6.5px !important;
		//top: 305.5px !important;
		box-shadow: 0 2px 10px rgb(0 0 0 / 20%);
	}
	.RuleRowRuleActions a img {
		padding-top: 9px;
    	vertical-align: bottom;
	}
	#id_dynamiccontenttags_block_name {
		margin-top:20px;
	}
}
@media screen and (max-width:360px){
	.FieldWidthFix{
		width:36% !important;
	}
	.buttonsFix,.buttonWidth{
		width:165px !important;
	}
	.ui-window{
		width:308px !important;
		//left:15.5px !important;
		//top: 434.5px !important;
	}
	#ui-datepicker-div+.ui-window {
		width: 298px !important;
		//left: 20.5px !important;
		//top: 498.5px !important;
		box-shadow: 0 2px 10px rgb(0 0 0 / 20%);
	}
	.content{
		width:91% !important;
	}
	.RuleRowRuleName{
		width:124px !important;
	}
	.RuleRowRuleOperator {
		width:44px !important;
	}
	.TextInputType{
		width:76px !important;
	}
	.RuleRowAddButton{
		margin-left:-4px !important;
	}
	.PageIntroP{
		width:279px;
	}
	.Heading2Width{
		width:98%;
	}
	.scrollableEditor{
		overflow-x:scroll !important;
		width:277px;
		margin-top:25px;
	}
	.RuleRowRuleActions a img {
		padding-top: 9px;
    	vertical-align: bottom;
	}
	#id_dynamiccontenttags_block_name {
		margin-top:20px;
	}
}
@media screen and (max-width:320px){
	.labelCheckbox{
		width:58% !important;
	}
	.BodyContainer{
		width:93%!important;
	}
	.inputTextFix, .ISSelectDiv, .ISSelectSearch,.ISSelect{
		width:170px !important; margin-right: 0px !important;
	}
	.FieldWidthFix{
		width:36% !important;
	}
	.ui-window{
		width:289px!important;
		//top: 305.5px !important;
		//left:6.5px !important;
	}
	#ui-datepicker-div+.ui-window {
		width: 280px!important;
		//top: 369.5px !important;
		//left: 11px !important;
		box-shadow: 0 2px 10px rgb(0 0 0 / 20%);
	}
	.PageIntroP {
    	width: 264px!important;
	}
	.RuleRowRuleName {
    	width: 112px !important;
	}
	.content{
		width:91.5% !important;
	}
	.scrollableEditor{
		width:256px!important;
	}
	.RuleRowRuleActions a img {
		padding-top: 9px;
    	vertical-align: bottom;
	}
	#id_dynamiccontenttags_block_name {
		margin-top:20px;
	}
}
html>body #blockListId li {
    height: 40px !important;
    line-height: unset !important; 
}
.ui-window {
    position: absolute !important;
    top: 40px !important;
    left: 0 !important;
    transform: translate(0px, 0px);
    -webkit-transform: translate(0px, 0px);
    -ms-transform: : translate(0px, 0px);
    -webkit: translate(0px, 0px);
    -moz-transform: : translate(0px, 0px);
    -o-transform: translate(0px, 0px);
    -webkit-transform: -webkit-translate(0px, 0px);
    bottom: 0;
    right: 0;
    margin: auto;
    width: fit-content !important;
}
</style>
