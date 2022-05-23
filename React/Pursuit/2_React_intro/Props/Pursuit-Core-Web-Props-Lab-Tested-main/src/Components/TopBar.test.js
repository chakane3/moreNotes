import { render, screen } from "@testing-library/react";
import TopBar from "./TopBar";

describe("TopBar", () => {
  beforeEach(() => {
    render(<TopBar />);
  });

  it("renders an h1", () => {
    expect(screen.getByRole("heading", { level: 1 }).textContent).toMatch(/^Go Fund.*/);
  });

  it("renders a description", () => {
    screen.getByText("Help me go on a vacation to a beach somewhere");
  });
});
