{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{def $uploadable_classes = ezini( 'CreateSettings', 'MimeClassMap', 'upload.ini' )|append( ezini( 'CreateSettings', 'DefaultClass', 'upload.ini' ) )|unique()
     $allowed_class_list = $attribute.class_content.class_constraint_list
     $merge_count = $uploadable_classes|merge( $allowed_class_list )|count()
     $merge_unique_count = $uploadable_classes|merge( $allowed_class_list )|unique()|count()}
{if and( ezmodule( 'ezjscore' ),
        or( $allowed_class_list|count()|eq( 0 ), $merge_count|gt( $merge_unique_count ) ) )}
    <input type="submit" value="{'Upload a file'|i18n( 'design/admin/content/datatype' )}"
            name="RelationUploadNew{$attribute.id}-{$attribute.version}"
            class="button relation-upload-new hide"
            title="{'Upload a file to create a new object and add it to the relation'|i18n( 'design/admin/content/datatype' )}" />

    {run-once}
    {ezscript_require( array( 'ezjsc::yui3', 'ezjsc::yui3io', 'ezmodalwindow.js', 'ezajaxuploader.js' ) )}
    <div id="relationlist-modal-window" class="modal-window" style="display:none;">
        <h2><a href="#" class="window-close">{'Close'|i18n( 'design/admin/pagelayout' )}</a><span></span></h2>
        <div class="window-content"></div>
    </div>
    <script type="text/javascript">
    {literal}
    (function () {
        YUI(YUI3_config).use('ezmodalwindow', 'ezajaxuploader', function (Y) {
            var uploaderConf = {
                target: {},
                open: {
                    action: 'ezajaxuploader::uploadform::ezobjectrelationlist'
                },
                upload: {
                    action: 'ezajaxuploader::upload::ezobjectrelationlist?ContentType=html',
                    form: 'form.ajaxuploader-upload'
                },
                location: {
                    action: 'ezajaxuploader::preview::ezobjectrelationlist',
                    form: 'form.ajaxuploader-location',
                    browse: 'div.ajaxuploader-browse',
        {/literal}
                    required: "{'Please choose a location'|i18n( 'design/admin/content/datatype' )|wash( 'javascript' )}"
        {literal}
                },

                preview: {
                    form: 'form.ajaxuploader-preview',

                    // this is the eZAjaxUploader instance
                    callback: function () {
                        var box = Y.one('#ezobjectrelationlist_browse_' + this.conf.target.ObjectRelationsAttributeId),
                            table = box.one('table.list');
                            tbody = box.one('table.list tbody'),
                            last = tbody.get('children').slice(-1).item(0),
                            tr = false, priority = false, tds = false,
                            result = this.lastMetaData;

                        if ( !table.hasClass('hide') ) {
                            // table is visible, clone the last line
                            tr = last.cloneNode(true);
                            tbody.append(tr);
                            if ( last.hasClass('bgdark') ) {
                                tr.removeClass('bgdark').addClass('bglight');
                            } else {
                                tr.removeClass('bglight').addClass('bgdark');
                            }
                        } else {
                            // table is hidden, no related object yet
                            // the only line in the table is the "template line"
                            tr = last;
                            table.removeClass('hide');
                        }
                        tds = tr.get('children');
                        tds.item(0).all('input').set('value', result.object_info.id);
                        tds.item(1).setContent(result.object_info.name);
                        tds.item(2).setContent(result.object_info.class_name);
                        tds.item(3).setContent(result.object_info.section_name);
                        tds.item(4).setContent(result.object_info.published);
                        priority = tds.item(5).one('input');
                        priority.set('value', parseInt(priority.get('value')) + 1);

                        box.one('.ezobject-relation-remove-button').removeClass('button-disabled').addClass('button').set('disabled', false);
                        box.all('.ezobject-relation-no-relation').addClass('hide');

                        this.modalWindow.close();
                    }
                },
        {/literal}
                validationErrorText: "{'Some required fields are empty.'|i18n( 'design/admin/content/datatype' )|wash( 'javascript' )}",
                parseJSONErrorText: "{'Unable to parse the JSON response.'|i18n( 'design/admin/content/datatype' )|wash( 'javascript' )}",
                title: "{'Upload a file and add the resulting object in the relation'|i18n( 'design/admin/content/datatype' )|wash( 'javascript' )}"
        {literal}
            };

            var windowConf = {
                window: '#relationlist-modal-window',
                centered: false,
                xy: ['centered', 50],
                width: 650
            };

            Y.on('domready', function() {
                var win = new Y.eZ.ModalWindow(windowConf),
                    tokenNode = Y.one('#ezxform_token_js');

                Y.all('.relation-upload-new').each(function () {
                    var data = this.get('name').replace("RelationUploadNew", '').split("-"),
                        conf = Y.clone(uploaderConf, true),
                        uploader;

                    conf.target = {
                       ObjectRelationsAttributeId: data[0],
                       Version: data[1]
                    };
                    if ( tokenNode ) {
                        conf.token = tokenNode.get('title');
                    }
                    uploader = new Y.eZ.AjaxUploader(win, conf);
                    this.on('click', function (e) {
                        uploader.open();
                        e.halt();
                    });
                    this.removeClass('hide');
                });
            });
        });

    })();
    {/literal}
    </script>
    {/run-once}
{/if}
{undef $merge_count $merge_unique_count $allowed_class_list $uploadable_classes}
