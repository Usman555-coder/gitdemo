<?php
/**
* The Custom Fields Text API. This only handles the text type of custom field.
*
* @version     $Id: customfields_text.php,v 1.18 2007/05/15 07:03:56 rodney Exp $
* @author Chris <chris@interspire.com>
*
* @package API
* @subpackage CustomFields_API
*/

/**
* Include the custom fields api if we need to.
* This includes the base API class itself, so we don't need to worry about it.
*/
require_once(dirname(__FILE__) . '/customfields.php');

/**
* This class handles validation and checking of type text custom fields.
*
* @package API
* @subpackage CustomFields_API
*/
class CustomFields_Text_API extends CustomFields_API
{

	/**
	* This overrides the parent classes setting so we know what sort it is.
	*
	* @see CustomFields_API::fieldtype
	*
	* @var String
	*/
    public $fieldtype = 'text';

	/**
	* Options for this custom field type.
	*
	* @var array
	*/
    public $Options = [
		'FieldLength' => '50',
		'MinLength' => '0',
		'MaxLength' => '0',
		'ApplyDefault' => ''
    ];

	/**
	* CheckData
	* Checkdata makes sure the data passed in is valid for this field type.
	* If the custom field is loaded, This always returns true - text fields accept any data.
	*
	* @param String $data The data to validate. Since this is a text field, anything is valid.
	*
	* @see ValidData
	* @see IsLoaded
	*
	* @return Boolean Returns false if the field hasn't been loaded properly, otherwise true.
	*/
	function CheckData($data='')
	{
        return !$this->IsLoaded() ? false : true;
	}

	/**
	* DisplayFieldOptions
	* This displays options for the custom field if it is loaded. This will print a simple text box for any sort of input.
	*
	* @param String $defaultvalue A default value for the item.
	* @param Boolean $useoptions Whether to use the fieldlength and maxlength options passed in. This is used when displaying forms but not in the admin area so the fields have a consistent look in the admin area.
	* @param Int $formid The form we are generating the content for. This is used to modify the form id's and javascript slightly to allow multiple forms to be on the same page.
	*
	* @see IsLoaded
	* @see Options
	*
	* @return String Returns a blank string if the custom field hasn't been loaded. If it has, it will create a text entry for the item.
	*/
	function DisplayFieldOptions($defaultvalue='', $useoptions=false, $formid=0)
	{
		if (!$this->IsLoaded()) {
			return '';
		}

		$formid = (int)$formid;

		$length = '';
		if ($useoptions && isset($this->Settings['FieldLength']) && $this->Settings['FieldLength'] > 0) {
			$length = " size='" . (int)$this->Settings['FieldLength'] . "'";
		}

		if ($this->Settings['MaxLength'] > 0) {
			$length .= " maxlength='" . (int)$this->Settings['MaxLength'] . "'";
		}

		$return_string = '<input type="text" name="CustomFields[' . $this->fieldid . ']" id="CustomFields_' . $this->fieldid;
		if ($formid > 0) {
			$return_string .= '_' . $formid;
		}
		$return_string .= '" value="' . htmlspecialchars($defaultvalue, ENT_QUOTES, SENDSTUDIO_CHARSET) . '"' . $length . '>';

		return $return_string;
	}
       
	/**
	* CreateJavascript
	* Creates a javascript check for this field for a form to use.
	* It uses the id of the field to check for a value.
	* If the field isn't loaded, then this returns nothing.
	* This is a very basic check.
	*
	* @param Int $formid The form that we are creating javascript for. We need to know this so we can reference the right javascript function.
	*
	* @see IsLoaded
	* @see Forms_API::GetHTML
	*
	* @return String Returns a string with javascript in it for the form to use.
	*/
	function CreateJavascript($formid=0) {
		if (!$this->IsLoaded()) {
			return '';
		}

		if (!$this->IsRequired()) {
			return '';
		}

		$formid = (int)$formid;

		$alert = sprintf(GetLang('Form_Javascript_Field'), $this->GetFieldName());

		$javascript = '
			var fname = "CustomFields_' . $this->fieldid;
			if ($formid > 0) {
				$javascript .= '_' . $formid;
			}
			$javascript .= '";
			var fld = document.getElementById(fname);
			if (fld.value == "") {
				alert("' . $alert . '");
				fld.focus();
				return false;
			}
		';
		return $javascript;
	}

}

?>
