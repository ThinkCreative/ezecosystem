<?php
/**
 * File containing the ContentCreateStructStub class
 *
 * @copyright Copyright (C) 1999-2013 eZ Systems AS. All rights reserved.
 * @license http://ez.no/licenses/gnu_gpl GNU General Public License v2.0
 * @version 
 */

namespace eZ\Publish\API\Repository\Tests\Stubs\Values\Content;

use eZ\Publish\API\Repository\Values\Content\Field;
use eZ\Publish\API\Repository\Values\Content\ContentCreateStruct;

/**
 * Stubbed implementation of the {@link \eZ\Publish\API\Repository\Values\Content\ContentCreateStruct}
 * class.
 *
 * @see \eZ\Publish\API\Repository\Values\Content\ContentCreateStruct
 */
class ContentCreateStructStub extends ContentCreateStruct
{
    /**
     * @var \eZ\Publish\API\Repository\Values\Content\Field[]
     */
    protected $fields = array();

    /**
     * Adds a field to the field collection.
     *
     * This method could also be implemented by a magic setter so that
     * $fields[$fieldDefIdentifier][$language] = $value or without language $fields[$fieldDefIdentifier] = $value
     * is an equivalent call.
     *
     * @param string $fieldDefIdentifier the identifier of the field definition
     *
     * @param mixed $value Either a plain value which is understandable by the corresponding
     *                     field type or an instance of a Value class provided by the field type
     *
     * @param string|null $language If not given on a translatable field the initial language is used
     */
    public function setField( $fieldDefIdentifier, $value, $language = null )
    {
        if ( null === $language && $this->contentType->getFieldDefinition( $fieldDefIdentifier )->isTranslatable )
        {
            $language = $this->mainLanguageCode;
        }

        $this->fields[] = new Field(
            array(
                'fieldDefIdentifier' => $fieldDefIdentifier,
                'value' => $value,
                'languageCode' => $language
            )
        );
    }
}
