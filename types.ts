
export enum UserRole {
  ALUMNO = 'ALUMNO',
  MAESTRO = 'MAESTRO'
}

export interface Book {
  id: number;
  title: string;
  subtitle: string;
  progress: number;
  locked: boolean;
  color: string;
}

export interface Chapter {
  id: number;
  bookId: number;
  title: string;
  content: string;
  verse: string;
  reference: string;
}

export interface Student {
  id: number;
  name: string;
  avatar: string;
  currentModule: string;
  pendingCorrection: boolean;
}

export type View = 'LOGIN' | 'STUDENT_HOME' | 'CHAPTER_VIEW' | 'TEACHER_PANEL' | 'CORRECTION_VIEW';
