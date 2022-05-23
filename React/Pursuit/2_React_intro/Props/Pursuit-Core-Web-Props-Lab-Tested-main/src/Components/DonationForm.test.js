import { render, screen } from "@testing-library/react";
import DonationForm from "./DonationForm";

describe("DonationForm", () => {
  beforeEach(() => {
    render(<DonationForm />);
  });

  it("renders name", () => {
    expect(screen.getAllByRole("textbox")[0]).toHaveAttribute("placeholder", "John Doe");
  });

  it("renders caption", () => {
    expect(screen.getAllByRole("textbox")[1]).toHaveAttribute("placeholder", "...");
  });

  it("renders amount", () => {
    const slider = screen.getByRole("slider");
    expect(slider).toHaveAttribute("max", "1000");
    expect(slider).toHaveAttribute("min", "5");
  });
});
