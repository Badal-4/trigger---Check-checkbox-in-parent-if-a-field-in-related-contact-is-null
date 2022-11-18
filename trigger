trigger trg2 on Contact(after Insert,after Update,after Undelete)
{
    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete))
    {
        if(trigger.new.size() > 0)
        {
            trgController.trgMethod(trigger.new,null);
        }
        else if(trigger.isAfter && trigger.isDelete)
        {
            if(trigger.old.size() > 0)
            {
                trgController.trgMethod(trigger.old,null);
            }
        }
        else if(trigger.isAfter && trigger.isUpdate)
        {
            if(trigger.oldMap != null && trigger.new.size() > 0)
            {
                trgController.trgMethod(trigger.new,trigger.oldMap);
            }
        }
    }
}
