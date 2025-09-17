import "../styles/globals.css";
import { ReactNode } from "react";

export const metadata = {
  title: "Compacta",
  description: "Plataforma educativa Compacta",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="es">
      <body>
        <header style={{ padding: "1rem", background: "var(--primary)", color: "white" }}>
          <h1>Compacta</h1>
        </header>
        <main style={{ padding: "1rem" }}>{children}</main>
        <footer style={{ padding: "1rem", background: "#eee", marginTop: "2rem" }}>
          <p>© 2025 Compacta</p>
        </footer>
      </body>
    </html>
  );
}
