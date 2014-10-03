<?php
/**
 * File containing a test class
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 * @version 2014.07.0
 */

namespace eZ\Publish\Core\REST\Server\Tests\Input\Parser;

use eZ\Publish\Core\REST\Server\Input\Parser\URLWildcardCreate;

class URLWildcardCreateTest extends BaseTest
{
    /**
     * Tests the URLWildcardCreate parser
     */
    public function testParse()
    {
        $inputArray = array(
            'sourceUrl' => '/source/url',
            'destinationUrl' => '/destination/url',
            'forward' => 'true'
        );

        $urlWildcardCreate = $this->getParser();
        $result = $urlWildcardCreate->parse( $inputArray, $this->getParsingDispatcherMock() );

        $this->assertEquals(
            array(
                'sourceUrl' => '/source/url',
                'destinationUrl' => '/destination/url',
                'forward' => true
            ),
            $result,
            'URLWildcardCreate not parsed correctly.'
        );
    }

    /**
     * Test URLWildcardCreate parser throwing exception on missing sourceUrl
     *
     * @expectedException \eZ\Publish\Core\REST\Common\Exceptions\Parser
     * @expectedExceptionMessage Missing 'sourceUrl' value for URLWildcardCreate.
     */
    public function testParseExceptionOnMissingSourceUrl()
    {
        $inputArray = array(
            'destinationUrl' => '/destination/url',
            'forward' => 'true'
        );

        $urlWildcardCreate = $this->getParser();
        $urlWildcardCreate->parse( $inputArray, $this->getParsingDispatcherMock() );
    }

    /**
     * Test URLWildcardCreate parser throwing exception on missing destinationUrl
     *
     * @expectedException \eZ\Publish\Core\REST\Common\Exceptions\Parser
     * @expectedExceptionMessage Missing 'destinationUrl' value for URLWildcardCreate.
     */
    public function testParseExceptionOnMissingDestinationUrl()
    {
        $inputArray = array(
            'sourceUrl' => '/source/url',
            'forward' => 'true'
        );

        $urlWildcardCreate = $this->getParser();
        $urlWildcardCreate->parse( $inputArray, $this->getParsingDispatcherMock() );
    }

    /**
     * Test URLWildcardCreate parser throwing exception on missing forward
     *
     * @expectedException \eZ\Publish\Core\REST\Common\Exceptions\Parser
     * @expectedExceptionMessage Missing 'forward' value for URLWildcardCreate.
     */
    public function testParseExceptionOnMissingForward()
    {
        $inputArray = array(
            'sourceUrl' => '/source/url',
            'destinationUrl' => '/destination/url'
        );

        $urlWildcardCreate = $this->getParser();
        $urlWildcardCreate->parse( $inputArray, $this->getParsingDispatcherMock() );
    }

    /**
     * Returns the URLWildcard input parser
     *
     * @return \eZ\Publish\Core\REST\Server\Input\Parser\URLWildcardCreate
     */
    protected function internalGetParser()
    {
        $parser = new URLWildcardCreate( $this->getParserTools() );
        $parser->setRequestParser( $this->getRequestParserMock() );
        return $parser;
    }
}
