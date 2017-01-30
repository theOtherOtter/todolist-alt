package fr.icdc.dei.todolist.service.impl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import fr.icdc.dei.todolist.persistence.dao.TaskDao;
import fr.icdc.dei.todolist.persistence.dao.TaskOwnerDao;
import fr.icdc.dei.todolist.persistence.dao.TaskStatusDao;
import fr.icdc.dei.todolist.persistence.dao.UserDao;
import fr.icdc.dei.todolist.persistence.entity.Task;
import fr.icdc.dei.todolist.persistence.entity.TaskOwner;
import fr.icdc.dei.todolist.persistence.entity.TaskStatus;
import fr.icdc.dei.todolist.persistence.entity.User;
import fr.icdc.dei.todolist.service.TodolistService;
import fr.icdc.dei.todolist.service.enums.TaskStatusEnum;

@Service
@Transactional
public class TodolistServiceImpl implements TodolistService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private TaskDao taskDao;
	
	@Autowired
	private TaskStatusDao taskStatusDao;
	
	@Autowired
	private TaskOwnerDao taskOwnerDao;

	@Override
	public List<Task> archiveTasks() {
		Calendar cal = Calendar.getInstance(); 
		cal.add(Calendar.MONTH, 1);
		List<Task> tasksToArchive =  taskDao.findAllByClosedDateBefore(cal.getTime());
		for(Task task:tasksToArchive){
			task.setStatus(new TaskStatus(TaskStatusEnum.ARCHIVED.getValue()));
			taskDao.save(task);
		}
		return tasksToArchive;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public Task affectTaskToUser(long idTask, long idUser) {
		Task task = taskDao.findOne(idTask);
		User userReciever = userDao.findOne(idUser);
		TaskOwner taskOwner = new TaskOwner(task, userReciever, false);
		taskOwnerDao.save(taskOwner);
		task.getTaskOwners().add(taskOwner);
		task.setStatus(new TaskStatus(TaskStatusEnum.DELEGATION_PENDING.getValue()));
		return taskDao.save(task);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public Task acceptDelegatedTask(long delegatedTaskId, long delegateUserId) {
		Task task = taskDao.findOne(delegatedTaskId);
		task.setStatus(new TaskStatus(TaskStatusEnum.DELEGATED.getValue()));
		return taskDao.save(task);
	}

	@Override
	public List<Task> listTasks() {
		return taskDao.findAll();
	}

	@Override
	public Task addTask(String taskName, int statusId) {
		return taskDao.save(new Task(taskName, statusId));
		
	}

	@Override
	public List<TaskStatus> listTaskStatus() {
		return taskStatusDao.findAll();
	}

	@Override
	//On termine une tâche
	public Task terminateTask(long idTask) 
	{
		//On recherche la tâche correspondante
		Task task = taskDao.findOne(idTask);
		//On prend la date du jour et on retire 7 jours (pour avoir la date d'il y a une semaine)
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -7);
		//Si la date d'il y a une semaine est supérieure à la date de début de la tâche (qu'elle a été créée il y a plus d'une semaine donc)
		//et que son statut est différent de FINISHED
		if ((cal.getTime().getTime() > task.getBeginDate().getTime()) && (task.getStatus().getId() != TaskStatusEnum.FINISHED.getValue())) 
		{
			//On set le statut à FINISHED et on save
			task.setStatus(new TaskStatus(TaskStatusEnum.FINISHED.getValue()));
			return taskDao.save(task);
		}
		//Sinon on retourne la tâche sans changements
		return task;
	}
}
