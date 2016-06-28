{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base='ContentObjectAttribute'
         html_class='full'}

<textarea id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="form-control {eq( $html_class, 'half' )|choose( 'box', 'halfbox' )} ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_text_{$attribute.id}" cols="70" rows="{$attribute.contentclass_attribute.data_int1}">{$attribute.content|wash}</textarea>

{def $snippet_editor_class_list = ezini('SnippetEditorSettings', 'ClassList', 'ngadminui.ini')}
{if $snippet_editor_class_list|contains($attribute.object.class_identifier)}
    {def $snippet_editor_config_section = concat( 'SnippetEditorClass_', $attribute.object.class_identifier )}
    {def $snippet_editor_fields_list = ezini( $snippet_editor_config_section, 'FieldList', 'ngadminui.ini')}

    {if $snippet_editor_fields_list|contains( $attribute.contentclass_attribute_identifier )}
        {def $field_settings_name = concat( 'SnippetEditorConfig_', $attribute.contentclass_attribute_identifier )}

        {if ezini_hasvariable( $snippet_editor_config_section, $field_settings_name, 'ngadminui.ini' )}
            {def $field_settings = ezini( $snippet_editor_config_section, $field_settings_name, 'ngadminui.ini' )}
        {/if}

        <div id="{$attribute_base}_data_text_{$attribute.id}" style="position: relative; width: 100%; height: {$attribute.contentclass_attribute.data_int1|mul(2)}em;" ></div>

        <script type="text/javascript">
            $(document).ready(function(){ldelim}
                var editor_mode = "{cond( and( is_set( $field_settings ), is_set( $field_settings.mode ) ), $field_settings.mode, 'html' )}";
                var editor_theme = "{cond( and( is_set( $field_settings ), is_set( $field_settings.theme ) ), $field_settings.theme, 'chrome' )}";
                var show_print_margin = {cond( and( is_set( $field_settings ), is_set( $field_settings.show_print_margin ) ), $field_settings.show_print_margin, 'false' )};
                var highlight_active_line = {cond( and( is_set( $field_settings ), is_set( $field_settings.highlight_active_line ) ), $field_settings.highlight_active_line, 'true' )};

                var editor_{$attribute.id} = ace.edit("{$attribute_base}_data_text_{$attribute.id}");
                editor_{$attribute.id}.setTheme("ace/theme/" + editor_theme);
                editor_{$attribute.id}.session.setMode("ace/mode/" + editor_mode);

                editor_{$attribute.id}.setOptions({ldelim}
                    enableBasicAutocompletion: true
                {rdelim});

                editor_{$attribute.id}.commands.on("afterExec", function(e){ldelim}
                    if (e.command.name == "insertstring"&&/^[\<.]$/.test(e.args)){ldelim}
                        editor_{$attribute.id}.execCommand("startAutocomplete");
                    {rdelim}
                {rdelim});
                editor_{$attribute.id}.setShowPrintMargin(show_print_margin);
                editor_{$attribute.id}.setHighlightActiveLine(highlight_active_line);

                var textarea_{$attribute.id} = $('textarea[name="{$attribute_base}_data_text_{$attribute.id}"]').hide();
                editor_{$attribute.id}.getSession().setValue(textarea_{$attribute.id}.val());
                editor_{$attribute.id}.getSession().on('change', function(){ldelim}
                    textarea_{$attribute.id}.val(editor_{$attribute.id}.getSession().getValue().trim());
                {rdelim});
            {rdelim});
        </script>
    {/if}
{/if}
{/default}
