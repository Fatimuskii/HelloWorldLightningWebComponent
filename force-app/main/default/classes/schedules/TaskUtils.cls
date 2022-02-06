global class TaskUtils {

    global static void remindOwners(List<Opportunity> opptys){

        List<Task> tasks = new List<Task>(); 
        Integer i = 0; 
        for( Opportunity op : opptys){

            Task auxtask = new Task(Description='Test task'+ i, WhatId = op.Id);
            tasks.add(auxtask);
            i++;
        }

        insert tasks;
    }
}
