package com.bcc.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.persistence.GroupDAO;

@Service
public class GroupServiceImpl implements GroupService {
	
	private static final Logger log = LoggerFactory.getLogger(GroupServiceImpl.class);
	
	@Inject
	private GroupDAO dao;
}
