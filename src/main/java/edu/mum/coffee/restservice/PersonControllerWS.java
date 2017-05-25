package edu.mum.coffee.restservice;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;

@RestController
@RequestMapping("/rest/person")
public class PersonControllerWS {
		
		@Autowired
		private PersonService personService;


        @PostMapping(value="/create")
		public ResponseEntity<Person> savePerson(@Valid @RequestBody Person person)
		{
			personService.savePerson(person);
			return new ResponseEntity<Person>(person, HttpStatus.CREATED);
			//return personService.savePerson(person);
		}

		@GetMapping("/")
		public ResponseEntity<List<Person>> listAllPerson() {

            List<Person> persons=  personService.getAllPerson();
			if (persons.size()==0) {
				return new ResponseEntity<List<Person>>(HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<List<Person>>(persons, HttpStatus.OK);
		}
		

		@PutMapping("/update")
		public ResponseEntity<Void> updatePerson(@Valid @RequestBody Person person) {
			Person foundPerson = personService.findById(person.getId());
			if (foundPerson == null) {
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} else {
				personService.savePerson(person);
				return new ResponseEntity<Void>(HttpStatus.OK);
			}

		}

	    @DeleteMapping("/{id}")
        public ResponseEntity<Void> deleteProduct(@PathVariable("id") long id) {
            Person foundPerson = personService.findById(id);
            if (foundPerson == null) {
                return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
            } else {
                personService.removePerson(foundPerson);
                return new ResponseEntity<Void>(HttpStatus.GONE);
            }
        }

	}

