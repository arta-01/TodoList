// SPDX-License-Identifier:MIT
pragma solidity ^0.8.12 ;

contract ToDoList{
uint public TaskCount; //default => 0
mapping(uint => Task) public Tasks;

struct Task{
    uint id;
    string Content;
    bool Complete; //default => false
}
event TaskCreated(uint id , string Content , bool Complete);
event TaskComplete(uint id , string Content , bool Complete);


function createTask(string memory _Content) public{
    TaskCount++;
    Tasks[TaskCount] = Task(TaskCount , _Content , false);
    emit TaskCreated(TaskCount , _Content , false);
}

function ToggleComplete(uint id) public {
    Task memory T = Tasks[id];
    T.Complete = true;
    Tasks[id] = T ;
    emit TaskComplete(id , Tasks[id].Content , true);
}

}