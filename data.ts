
import { Book, Student } from './types';

export const BOOKS: Book[] = [
  { id: 1, title: 'Fundamentos de Fe', subtitle: 'Módulo 1', progress: 65, locked: false, color: 'bg-primary' },
  { id: 2, title: 'Vida de Oración', subtitle: 'Módulo 2', progress: 0, locked: true, color: 'bg-slate-400' },
  { id: 3, title: 'El Carácter de Cristo', subtitle: 'Módulo 3', progress: 0, locked: true, color: 'bg-slate-400' },
  { id: 4, title: 'El Gran Mandato', subtitle: 'Módulo 4', progress: 0, locked: true, color: 'bg-slate-400' },
  { id: 5, title: 'La Iglesia Primitiva', subtitle: 'Módulo 5', progress: 0, locked: true, color: 'bg-slate-400' },
  { id: 6, title: 'Vida Eterna', subtitle: 'Módulo 6', progress: 0, locked: true, color: 'bg-slate-400' },
];

export const STUDENTS: Student[] = [
  { id: 1, name: 'Juan Delgado', avatar: 'https://picsum.photos/seed/juan/200', currentModule: 'Módulo 2: Oración', pendingCorrection: true },
  { id: 2, name: 'María Castro', avatar: 'https://picsum.photos/seed/maria/200', currentModule: 'Módulo 1: Fundamentos', pendingCorrection: false },
  { id: 3, name: 'Roberto Sánchez', avatar: 'https://picsum.photos/seed/roberto/200', currentModule: 'Módulo 3: Servicio', pendingCorrection: true },
  { id: 4, name: 'Elena López', avatar: 'https://picsum.photos/seed/elena/200', currentModule: 'Módulo 4: Testimonio', pendingCorrection: false },
];
