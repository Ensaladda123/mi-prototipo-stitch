
import React, { useState } from 'react';
import { View, UserRole, Book, Student } from './types';
import LoginScreen from './screens/LoginScreen';
import StudentHome from './screens/StudentHome';
import ChapterView from './screens/ChapterView';
import TeacherPanel from './screens/TeacherPanel';
import CorrectionView from './screens/CorrectionView';

const App: React.FC = () => {
  const [currentView, setCurrentView] = useState<View>('LOGIN');
  const [role, setRole] = useState<UserRole | null>(null);
  const [selectedBook, setSelectedBook] = useState<Book | null>(null);
  const [selectedStudent, setSelectedStudent] = useState<Student | null>(null);

  const navigateTo = (view: View) => {
    setCurrentView(view);
  };

  const handleLogin = (selectedRole: UserRole) => {
    setRole(selectedRole);
    if (selectedRole === UserRole.ALUMNO) {
      navigateTo('STUDENT_HOME');
    } else {
      navigateTo('TEACHER_PANEL');
    }
  };

  const handleBookClick = (book: Book) => {
    if (!book.locked) {
      setSelectedBook(book);
      navigateTo('CHAPTER_VIEW');
    }
  };

  const handleStudentClick = (student: Student) => {
    setSelectedStudent(student);
    navigateTo('CORRECTION_VIEW');
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-slate-200">
      <div className="w-full max-w-[430px] h-screen max-h-[932px] bg-white dark:bg-background-dark shadow-2xl relative overflow-hidden flex flex-col">
        {currentView === 'LOGIN' && (
          <LoginScreen onLogin={handleLogin} />
        )}

        {currentView === 'STUDENT_HOME' && (
          <StudentHome 
            onBookClick={handleBookClick} 
            onLogout={() => navigateTo('LOGIN')} 
          />
        )}

        {currentView === 'CHAPTER_VIEW' && (
          <ChapterView 
            book={selectedBook!} 
            onBack={() => navigateTo('STUDENT_HOME')} 
          />
        )}

        {currentView === 'TEACHER_PANEL' && (
          <TeacherPanel 
            onStudentClick={handleStudentClick}
            onLogout={() => navigateTo('LOGIN')}
          />
        )}

        {currentView === 'CORRECTION_VIEW' && (
          <CorrectionView 
            student={selectedStudent!} 
            onBack={() => navigateTo('TEACHER_PANEL')} 
          />
        )}
      </div>
    </div>
  );
};

export default App;
