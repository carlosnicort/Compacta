export default function Navbar() {
  return (
    <nav className="w-full bg-white shadow-md p-4 flex justify-between">
      <span className="font-bold text-xl text-blue-700">EduApp</span>
      <div className="space-x-4">
        <a href="/" className="text-gray-600 hover:text-blue-600">Inicio</a>
        <a href="/alumnos" className="text-gray-600 hover:text-blue-600">Alumnos</a>
        <a href="/profesores" className="text-gray-600 hover:text-blue-600">Profesores</a>
      </div>
    </nav>
  )
}