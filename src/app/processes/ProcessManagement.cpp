#include "ProcessManagement.hpp"
#include "../encryptDecrypt/Cryption.hpp"
#include "Task.hpp"
#include <cstring>
#include <iostream>
#include <memory>
#include <sys/wait.h>
#include <utility>

ProcessManagement::ProcessManagement() {}

bool ProcessManagement::submitToQueue(std::unique_ptr<Task> task) {
  taskQueue.push(std::move(task));
  return true;
}

void ProcessManagement::executeTask() {
  while (!taskQueue.empty()) {
    std::unique_ptr<Task> taskToExecute = std::move(taskQueue.front());
    taskQueue.pop();
    std::cout << "Executing task: " << taskToExecute->toString() << std::endl;
    executeCryption(taskToExecute->toString());
  }
};
