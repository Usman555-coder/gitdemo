<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">



        <script src="includes/js/jquery/plugins/jquery.plugin.js"></script>
        <script src="includes/js/imodal/imodal.js"></script>
        <!-- <script src="includes/js/jquery/plugins/jquery.iModal.js"></script> -->
        <script src="includes/js/jquery/plugins/jquery.tableSelector.js"></script>
        <script src="includes/js/jquery/plugins/jquery.window.js"></script>
        <script src="includes/js/jquery/plugins/jquery.window-extensions.js"></script>
        <link rel="stylesheet" href="includes/js/imodal/imodal.css" type="text/css" media="screen" />
        <script src="includes/js/tiny_mce/tiny_mce.min.js"></script>
        <script src="includes/js/tiny_mce/jquery.tiny_mce.min.js"></script>
        <link rel="stylesheet" href="includes/js/imodal/imodal.css" type="text/css" media="screen" />

        <style>
            textarea#full-featured-non-premium{
                height: 350px;
            }

            div.card,
            .tox div.card {
                width: 240px;
                background: white;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-shadow: 0 4px 8px 0 rgba(34, 47, 62, .1);
                padding: 8px;
                font-size: 14px;
                font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen-Sans,Ubuntu,Cantarell,"Helvetica Neue",sans-serif;
            }

            div.card::after,
            .tox div.card::after {
                content: "";
                clear: both;
                display: table;
            }

            div.card h1,
            .tox div.card h1 {
                font-size: 14px;
                font-weight: bold;
                margin: 0 0 8px;
                padding: 0;
                line-height: normal;
                font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen-Sans,Ubuntu,Cantarell,"Helvetica Neue",sans-serif;
            }

            div.card p,
            .tox div.card p {
                font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen-Sans,Ubuntu,Cantarell,"Helvetica Neue",sans-serif;
            }

            div.card img.avatar,
            .tox div.card img.avatar {
                width: 48px;
                height: 48px;
                margin-right: 8px;
                float: left;
            }
        </style>
    </head>
    <body>

        <textarea rows="10" id="{$editor.ElementId}" name="{$editor.ElementId}" class="InterspireEditor">
            {$editor.HtmlContent}
        </textarea>
        <script>
            tinyMCE.init({
                mode: "exact",
                selector: '.InterspireEditor',
                editor_selector: "InterspireEditor",
                elements: "{$editor.ElementId}",

                inline_styles: false,

                convert_fonts_to_spans: false,
                force_hex_style_colors: false,
                fix_table_elements: true,
                fix_list_elements: true,
                fix_nesting: false,
                forced_root_block: false,
                valid_children: "+body[style]",

                document_base_url: "{$editor.AppUrl}",
                relative_urls: false,
                document_base_url: "{$editor.AppUrl}",
                content_css: "{$editor.FullUrl}skins/content/dark/content.css",
                plugins: '{$plugins} print preview paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
                external_image_list_url: "{$editor.AppUrl}/admin/index.php?Page=ImageManager&Action=getimageslist&Type={$editor.ImageDirType}&TypeId={$editor.ImageDirTypeId}",
                        external_link_list_url: "{$editor.AppUrl}/admin/index.php?Action=GetPredefinedLinkList",
                        cleanup_on_startup: true,
                        cleanup_callback: "Application.Modules.TinyMCE.customCleanup",
                        verify_html: false,
                        width: "{$editor.Width}",
                        height: "{$editor.Height}",
                        force_p_newlines: false,
                        imgPathType: '{$editor.ImageDirType}',
                        imgPathTypeId: '{$editor.ImageDirTypeId}',
                        template_replace_values: {
                        },
                        //imagetools_cors_hosts: ['picsum.photos'],
                        menubar: 'file edit view insert format tools table help',
                        toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
                        toolbar_sticky: true,
                        autosave_ask_before_unload: true,
                        autosave_interval: "30s",
                        autosave_prefix: "{path}{query}-{id}-",
                        autosave_restore_when_empty: false,
                        autosave_retention: "2m",
                        image_advtab: true,

                        /* link_list: [
                         { title: 'My page 1', value: 'http://www.tinymce.com' },
                         { title: 'My page 2', value: 'http://www.moxiecode.com' }
                         ],
                         image_list: [
                         { title: 'My page 1', value: 'http://www.tinymce.com' },
                         { title: 'My page 2', value: 'http://www.moxiecode.com' }
                         ], */
                        // image_class_list: [
                        // { title: 'None', value: '' },
                        // { title: 'Some class', value: 'class-name' }
                        //],
                        //importcss_append: true,

                        //file_picker_callback: function (callback, value, meta) {
                        /* Provide file and text for the link dialog */
                        //if (meta.filetype === 'file') {
                        // callback('https://www.google.com/logos/google.jpg', { text: 'My text' });
                        // }

                        /* Provide image and alt text for the image dialog */
                        // if (meta.filetype === 'image') {
                        // callback('https://www.google.com/logos/google.jpg', { alt: 'My alt text' });
                        // }

                        /* Provide alternative source and posted for the media dialog */
                        // if (meta.filetype === 'media') {
                        // callback('movie.mp4', { source2: 'alt.ogg', poster: 'https://www.google.com/logos/google.jpg' });
                        // }
                        //},
                        /* spellchecker_callback: function (method, text, success, failure) {
                         var words = text.match(this.getWordCharPattern());
                         if (method === "spellcheck") {
                         var suggestions = {};
                         for (var i = 0; i < words.length; i++) {
                         suggestions[words[i]] = ["First", "Second"];
                         }
                         success({ words: suggestions, dictionary: [ ] });
                         } else if (method === "addToDictionary") {
                         // Add word to dictionary here
                         success();
                         }
                         }, */
                        templates: [
            {title: 'New Table', description: 'creates a new table', content: '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'},
            {title: 'Starting my story', description: 'A cure for writers block', content: 'Once upon a time...'},
            {title: 'New list with dates', description: 'New List with dates', content: '<div class="mceTmpl"><span class="cdate">cdate</span><br /><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'}
                        ],
                        template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
                        template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
                        height: 600,
                        image_caption: true,
                        quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
                        noneditable_noneditable_class: "mceNonEditable",
                        toolbar_drawer: 'sliding',
                        contextmenu: "link image imagetools table",
                        setup: function (ed) {
                            // Add a custom field button
                            ed.ui.registry.addButton('cfbutton', {
                                title: 'Custom Fields',
                                image: '{$editor.AppUrl}/admin/images/mce_customfields.gif',
                                onclick: function () {
                                    javascript: ShowCustomFields('html', 'myDevEditControl', '%%PAGE%%');
                                    return false;
                                }
                            });
            {$dynamicContentPopup}
                        }
                    });



        </script>
    </body>
</html>
