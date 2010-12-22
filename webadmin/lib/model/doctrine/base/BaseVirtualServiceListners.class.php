<?php

/**
 * BaseVirtualServiceListners
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property bigint $virtual_service_id
 * @property bigint $listner_id
 * @property VirtualService $VirtualService
 * @property Listner $Listner
 * 
 * @method bigint                 getVirtualServiceId()   Returns the current record's "virtual_service_id" value
 * @method bigint                 getListnerId()          Returns the current record's "listner_id" value
 * @method VirtualService         getVirtualService()     Returns the current record's "VirtualService" value
 * @method Listner                getListner()            Returns the current record's "Listner" value
 * @method VirtualServiceListners setVirtualServiceId()   Sets the current record's "virtual_service_id" value
 * @method VirtualServiceListners setListnerId()          Sets the current record's "listner_id" value
 * @method VirtualServiceListners setVirtualService()     Sets the current record's "VirtualService" value
 * @method VirtualServiceListners setListner()            Sets the current record's "Listner" value
 * 
 * @package    webadmin
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseVirtualServiceListners extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('virtual_service_listners');
        $this->hasColumn('virtual_service_id', 'bigint', null, array(
             'type' => 'bigint',
             'primary' => true,
             ));
        $this->hasColumn('listner_id', 'bigint', null, array(
             'type' => 'bigint',
             'primary' => true,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('VirtualService', array(
             'local' => 'virtual_service_id',
             'foreign' => 'id'));

        $this->hasOne('Listner', array(
             'local' => 'listner_id',
             'foreign' => 'id'));
    }
}