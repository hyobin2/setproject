/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {

	config.language = 'ko';
	config.toolbarCanCollapse = true;

	/*
	 * C.K.J CUSTOM TOOLBAR
	config.toolbar = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', '-', 'Preview', 'Print' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
		{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
		{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
		{ name: 'justify', items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'RemoveFormat' ] },
		'/',
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
		{ name: 'font', items: [ 'Font'] },
		{ name: 'styles', items: [  'FontSize' , 'Styles', 'Format' ] },
		{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
		{ name: 'tools', items: [ 'Maximize' ] },
		{ name: 'others', items: [ '-' ] },
		{ name: 'about', items: [ 'About' ] }
	];


	config.toolbar = [
	    { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', '-', 'Preview', 'Print' ] },
  		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
  		{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
  		{ name: 'justify', items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
  		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'RemoveFormat' ] },
  		'/',
  		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
  		{ name: 'font', items: [ 'Font'] },
  		{ name: 'styles', items: [  'FontSize' ] },
  		{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
  		{ name: 'tools', items: [ 'Maximize' ] },
  		{ name: 'others', items: [ '-' ] },
  		{ name: 'about', items: [ 'About' ] }
  	];

	config.removeDialogTabs = 'image:advanced;link:advanced';

 */
 /*
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Form,Superscript,Subscript,Anchor,Flash,Smiley,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Cut,Copy,Templates,image:advanced;link:advanced';
	*/
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'list', groups: [ 'list', 'indent', 'blocks' ] },
		{ name: 'align', groups : [ 'align', 'bidi' ] },
		{ name: 'links', groups: [ 'links' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Table,Styles,Language,Paste,PasteFromWord,Save,Form,Superscript,Subscript,Anchor,Flash,Smiley,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Cut,Copy,Templates,image:advanced;link:advanced';

	config.format_tags = 'p;h1;h2;h3;pre';
	config.fontSize_defaultLabel = '12px';
	config.fontSize_sizes = '8px/8px;9px/9px;10px/10px;11px/11px;12px/12px;14px/14px;16px/16px;18px/18px;20px/20px;22px/22px;24px/24px;26px/26px;36px/36px;48px/48px;';
	//config.font_defaultLabel = 'Gulim';
	//config.font_names = 'Gulim/Gulim;Dotum/Dotum;Batang/Batang;Gungsuh/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana;';

	config.font_names = '맑은 고딕; 돋움; 굴림; 궁서; 바탕;'+
	'Arial/Arial, Helvetica, sans-serif;' +
	'Comic Sans MS/Comic Sans MS, cursive;' +
	'Courier New/Courier New, Courier, monospace;' +
	'Georgia/Georgia, serif;' +
	'Lucida Sans Unicode/Lucida Sans Unicode, Lucida Grande, sans-serif;' +
	'Tahoma/Tahoma, Geneva, sans-serif;' +
	'Times New Roman/Times New Roman, Times, serif;' +
	'Trebuchet MS/Trebuchet MS, Helvetica, sans-serif;' +
	'Verdana/Verdana, Geneva, sans-serif';

	config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_P;
	config.startupFocus = false;


	config.image_previewText = '<br/>이미지가 배치될 예시 내용입니다.<br />좌측 하단의 "정렬" 옵션을 선택하여, 이미지가 배치될 형태를 변경해보세요.';
	//config.bodyClass='ckeditorView';
	//config.contentsCss = '/resources/css/common.css';
	//config.contentsCss = '/resources/css/sub_content.css';

	config.forcePasteAsPlainText = true;
	config.pasteFromWord=false;
	config.pasteFromWordRemoveFontStyles = true;
	config.pasteFromWordRemoveStyles = true;
	config.pasteFromWordNumberedHeadingToList =false;
	config.keystrokes = [
	  //[ CKEDITOR.CTRL + 86 , 'pastetext' ]
	];

	//config.protectedSource.push(/<code>[\s\S]*?<\/code>/gi); // Code tags
	config.allowedContent = true;
    config.extraAllowedContent = 'span(*)[*]{*};div(*)[*]{*};li(*)[*]{*};ul(*)[*]{*}';
    CKEDITOR.dtd.$removeEmpty.i = 0;

	config.extraPlugins = '';
	config.height = '400px';

	/* 확장 플러그인 */
	config.extraPlugins = 'tableresize';
	config.extraPlugins = 'youtube';
};


CKEDITOR.on('dialogDefinition', function (ev) {
            var dialogName = ev.data.name;
            var dialog = ev.data.definition.dialog;
            var dialogDefinition = ev.data.definition;
            if (dialogName == 'image') {

                dialogDefinition.removeContents('advanced'); // 자세히탭 제거
                dialogDefinition.removeContents('Link'); // 링크탭 제거
                //dialogDefinition.removeContents('Upload'); // 업로드탭
            }
});

/*
CKEDITOR.on('instanceReady', function(ev){
	ev.editor._.commands.paste = ev.editor._.commands.pastetext;
});
*/