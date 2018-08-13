<?php

namespace Netgen\Bundle\AdminUIBundle\Layouts\EventListener;

use Netgen\Bundle\BlockManagerAdminBundle\Event\AdminMatchEvent;
use Netgen\Bundle\BlockManagerAdminBundle\Event\BlockManagerAdminEvents;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class SetAdminPageLayoutListener implements EventSubscriberInterface
{
    /**
     * @var string
     */
    private $pageLayoutTemplate;

    /**
     * @var bool
     */
    private $isAdminSiteAccess = false;

    /**
     * @param $pageLayoutTemplate string
     */
    public function __construct($pageLayoutTemplate)
    {
        $this->pageLayoutTemplate = $pageLayoutTemplate;
    }

    public static function getSubscribedEvents()
    {
        return array(BlockManagerAdminEvents::ADMIN_MATCH => 'onAdminMatch');
    }

    /**
     * Sets if the current siteaccess will be considered as Netgen Admin UI siteaccess.
     *
     * @param null|bool $isAdminSiteAccess
     */
    public function setIsAdminSiteAccess($isAdminSiteAccess = null)
    {
        if (is_bool($isAdminSiteAccess)) {
            $this->isAdminSiteAccess = $isAdminSiteAccess;
        }
    }

    /**
     * Sets the pagelayout template for admin interface.
     */
    public function onAdminMatch(AdminMatchEvent $event)
    {
        if (!$this->isAdminSiteAccess) {
            return;
        }

        $event->setPageLayoutTemplate($this->pageLayoutTemplate);
    }
}
