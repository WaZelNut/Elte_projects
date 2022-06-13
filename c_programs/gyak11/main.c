#include <stdio.h>

typedef struct Student{
	int id;
	int age;
	double average;
} Student;

int highestAverageStudent(Student *students, int length);

//typedef struct Student Student;
// Ezt bele lehet rejteni a structba

int main(void){
	//elso feladat
	int s = sizeof(Student);
	printf("sizeof(struct Student) : %d\n", s);
	s = sizeof(double);
	printf("sizeof(double) : %d\n", s);

	//masodik feladat
	Student students[] = {
		{4.8, 3, 19},
		{4.7, 4, 20},
		{4.9, 5, 19}
	};
	int length = sizeof(students) / sizeof(students[0]);
	int hAverage = highestAverageStudent(students, length);

	printf("id of highest average student: %d\n", hAverage);

	return 0;
}


int highestAverageStudent(Student *students, int length){
	if (students){	//ha nem NULL, akkor belép 
		int index = 0;
		for (int i = 1; i < length; i++){
			if (students[index].average < students[i].average){
				index = i;
			}
		}
		return students[index].id;
	}
}
